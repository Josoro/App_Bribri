import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diccionario_animales_en_bribri/models/animal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadFirebaseData extends ChangeNotifier {
  final FirebaseStorage storage = FirebaseStorage.instanceFor(
      app: FirebaseFirestore.instance.app,
      bucket: 'gs://diccionario-animales-en-bribri.appspot.com');

  List<Animal> onDisplayAnimals = [];

  LoadFirebaseData() {
    print('Animals Provider inicializado');
    inicializa();
    getListAnimals();
  }

  void inicializa() {
    Firebase.initializeApp();
  }

  getListAnimals() async {
    print('ENTRO');
    FirebaseFirestore firestore =
        FirebaseFirestore.instanceFor(app: FirebaseFirestore.instance.app);
    CollectionReference collectionReference = firestore.collection('Animales');
    QuerySnapshot animales = await collectionReference.get();
    if (animales.docs.isNotEmpty) {
      print('ENTRO1');
      for (var doc in animales.docs) {
        print('ENTRO2');
        print(doc);
        onDisplayAnimals.add(Animal(
            id: doc['id'],
            name: doc['name'],
            nameBribri: doc['nameBribri'],
            description: doc['description'],
            category: doc['category'],
            token: doc['token']));
      }
      notifyListeners();
    }
    print('ENTRO3');
    print(onDisplayAnimals);
  }
}
