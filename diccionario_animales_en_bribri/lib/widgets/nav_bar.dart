import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 06.0),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/jaguar.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 25.0),
            Text(
              'Diccionario Bribrí',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 5.0),
            Text(
              'Por DCJ & JSR',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'animal_cards_screen');
        },
        leading: const Icon(
          Icons.home_rounded,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Inicio'),
      ),
      const Divider(),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.color_lens,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Tema'),
      ),
      const Divider(),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.info_rounded,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Información de los bribris'),
      ),
      const Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'maps_screen');
        },
        leading: const Icon(
          Icons.map_sharp,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Donde se ubican'),
      ),
    ]);
  }
}
