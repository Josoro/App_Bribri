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
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(''),
            ),
            SizedBox(height: 25.0),
            Text(
              'Diccionario Bribri',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 5.0),
            Text(
              'By DCJ',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.color_lens,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Tema'),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.info_rounded,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Información de los bribris'),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.maps_home_work_rounded,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Donde se ubican'),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.exit_to_app_rounded,
          color: Color.fromARGB(255, 35, 138, 151),
        ),
        title: const Text('Salir'),
      ),
    ]);
  }
}
