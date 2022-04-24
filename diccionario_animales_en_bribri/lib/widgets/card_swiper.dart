import 'package:card_swiper/card_swiper.dart';
import 'package:diccionario_animales_en_bribri/models/animal.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.animals}) : super(key: key);
  final List<Animal> animals;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: animals.length,
        layout: SwiperLayout.TINDER,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.3,
        itemBuilder: (_, int index) {
          //El GestureDetector ayuda a navegar a otra pantalla, cuando se le da click.
          final animal = animals[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'animal_information',
                arguments: animal),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(animals[index].fullImgUrl),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
