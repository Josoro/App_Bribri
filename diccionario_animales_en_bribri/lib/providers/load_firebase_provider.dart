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
  List<Animal> animalsCategory = [];
  List<Animal> animalsSearch = [];

  LoadFirebaseData() {
    print('Animals Provider inicializado');
    inicializa();
    getListAnimals();
  }

  void inicializa() {
    Firebase.initializeApp();
  }

  getListAnimals() async {
    FirebaseFirestore firestore =
        FirebaseFirestore.instanceFor(app: FirebaseFirestore.instance.app);
    CollectionReference collectionReference = firestore.collection('Animales');
    QuerySnapshot animales = await collectionReference.get();
    if (animales.docs.isNotEmpty) {
      for (var doc in animales.docs) {
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
  }

  getAnimalsByCategory(int cateroryNum) async {
    FirebaseFirestore firestore =
        FirebaseFirestore.instanceFor(app: FirebaseFirestore.instance.app);
    CollectionReference collectionReference = firestore.collection('Animales');
    QuerySnapshot animales = await collectionReference.get();
    if (animales.docs.isNotEmpty) {
      for (var doc in animales.docs) {
        if (doc['category'] == cateroryNum) {
          animalsCategory.add(Animal(
              id: doc['id'],
              name: doc['name'],
              nameBribri: doc['nameBribri'],
              description: doc['description'],
              category: doc['category'],
              token: doc['token']));
        }
      }
      notifyListeners();
    }
  }

  getAnimalsSearch(String palabra) async {
    FirebaseFirestore firestore =
        FirebaseFirestore.instanceFor(app: FirebaseFirestore.instance.app);
    CollectionReference collectionReference = firestore.collection('Animales');
    QuerySnapshot animales = await collectionReference.get();
    if (animales.docs.isNotEmpty) {
      for (var doc in animales.docs) {
        if (doc['name'].toString().contains(palabra)) {
          animalsSearch.add(Animal(
              id: doc['id'],
              name: doc['name'],
              nameBribri: doc['nameBribri'],
              description: doc['description'],
              category: doc['category'],
              token: doc['token']));
        }
      }
      notifyListeners();
    }
  }
}
