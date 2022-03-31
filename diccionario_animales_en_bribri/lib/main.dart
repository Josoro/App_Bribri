import 'package:diccionario_animales_en_bribri/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diccionario de los Bribris',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'animal_cards': (_) => const AnimalCardsScreen(),
        'animal_information': (_) => const AnimalInformationScreen(),
      },
      //Tema principal de la app/appBar.
      theme: ThemeData(fontFamily: 'Bongalo'),
    );
  }
}
