//Pantalla de las tarjetas del diccionario de los animales Bribris.
import 'package:diccionario_animales_en_bribri/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimalCardsScreen extends StatelessWidget {
  const AnimalCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diccionario de animales en Bribri'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: const [
          CardSwiper()
          //Listado horizontal de los animales.
        ],
      ),
    );
  }
}
