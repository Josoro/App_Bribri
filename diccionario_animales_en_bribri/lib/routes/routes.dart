import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diccionario_animales_en_bribri/screens/maps_screen.dart';
import 'package:diccionario_animales_en_bribri/screens/animal_cards_screen.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.house, 'Inicio', const AnimalCardsScreen()),
  _Route(FontAwesomeIcons.circleInfo, 'Información de los bribris',
      const AnimalCardsScreen()),
  _Route(
      FontAwesomeIcons.mapLocationDot, 'Donde se ubican', const MapsScreen()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
