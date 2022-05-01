import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/animal.dart';
import '../providers/load_firebase_provider.dart';

class AnimalSlider extends StatelessWidget {
  const AnimalSlider({Key? key, required this.title, required this.category})
      : super(key: key);
  final String title;
  final int category;

  @override
  Widget build(BuildContext context) {
    final animalsProvider = Provider.of<LoadFirebaseData>(context);
    final List<Animal> animals;

    animals = animalsProvider.getAnimalsByCategory(category);
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(title,
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
