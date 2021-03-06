import 'package:diccionario_animales_en_bribri/screens/screens.dart';
import 'package:diccionario_animales_en_bribri/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeChanger(2), child: const AppState()));
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoadFirebaseData(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currenttheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diccionario de los Bribris',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'animal_cards_screen': (_) => const AnimalCardsScreen(),
        'animal_information': (_) => const AnimalInformationScreen(),
        'maps_screen': (_) => const MapsScreen(),
      },
      //Tema principal de la app/appBar.
      //theme: ThemeData(fontFamily: 'Bongalo'),
    );
  }
}
