//Pantalla de inicio
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 150),
              child: const Text(
                'Diccionario animales en Bribrí',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'Bongalo'),
                maxLines: 2,
              ),
            ),
            const Image(image: AssetImage('assets/jaguar.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: MaterialButton(
                    height: 40.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, 'animal_cards'),
                    color: const Color.fromARGB(255, 0, 162, 135),
                    child: const Text('Ver',
                        style: TextStyle(
                            fontFamily: 'Bongalo',
                            color: Colors.black,
                            fontSize: 28)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Center(
          child: AdmobBanner(
              adUnitId: 'ca-app-pub-3940256099942544/6300978111',
              adSize: AdmobBannerSize.BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic>? args) {}),
        ),
      ),
    );
  }
}
