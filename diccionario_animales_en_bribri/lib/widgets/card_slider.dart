import 'package:flutter/material.dart';

import '../models/animal.dart';

class AnimalSlider extends StatelessWidget {
  const AnimalSlider({Key? key, required this.animals}) : super(key: key);
  final List<Animal> animals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Animales',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animals.length,
                itemBuilder: (_, int index) => _AnimalSlider(
                      animal: animals[index],
                    )),
          ),
        ],
      ),
    );
  }
}

class _AnimalSlider extends StatelessWidget {
  const _AnimalSlider({Key? key, required this.animal}) : super(key: key);
  final Animal animal;
  @override
  Widget build(BuildContext context) {
    animal.animalId = 'slider-${animal.id}';

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'animal_information',
                arguments: animal),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(animal.fullImgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            animal.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
