import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.TINDER,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.3,
        itemBuilder: (_, int index) {
          //El GestureDetector ayuda a navegar a otra pantalla, cuando se le da click.
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'animal_information',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/diccionario-animales-en-bribri.appspot.com/o/prueba.png?alt=media&token=142d5c3a-bf45-4a37-8a2e-e34c1f596ecc'),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
