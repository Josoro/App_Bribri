//Pantalla secundaria de las tarjetas del diccionario de los animales Bribris.
import 'dart:async';

import 'package:diccionario_animales_en_bribri/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../providers/load_firebase_provider.dart';
import 'package:provider/provider.dart';

class AnimalCardsScreen extends StatelessWidget {
  const AnimalCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalsProvider = Provider.of<LoadFirebaseData>(context);

    animalsProvider.getAnimalsByCategory(1);

    return Scaffold(
        drawer: const Drawer(
          child: NavBar(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Animales en Bribrí',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //Tarjetas principales de los animales
            CardSwiper(animals: animalsProvider.onDisplayAnimals),
            //Listado horizontal de los animales.
            AnimalSlider(
              category: 1,
              title: 'Felinos / na̱mù̱',
            ),
            AnimalSlider(
              category: 2,
              title: 'Serpientes / (tchabë )',
            ),
            AnimalSlider(
              category: 2,
              title: 'Peces / (namà)',
            ),
            AnimalSlider(
              category: 2,
              title: 'Aves / (dù)',
            )
          ]),
        ));
  }
}
