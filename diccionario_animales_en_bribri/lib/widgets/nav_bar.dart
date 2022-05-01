import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diccionario_animales_en_bribri/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diccionario_animales_en_bribri/theme/theme.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 67),
          width: double.infinity,
          height: 170,
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/jaguar.png'),
            backgroundColor: Colors.transparent,
          ),
        )),
        const SizedBox(height: 25.0),
        const Text(
          'Diccionario Bribrí',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 5.0),
        const Text(
          'Por DCJ & JSR',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        const ModoOscuro(),
        const Expanded(child: ListaOpciones()),
      ],
    );
  }
}

class ListaOpciones extends StatelessWidget {
  const ListaOpciones({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context).currenttheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) =>
          const Divider(color: Color.fromARGB(255, 165, 165, 101)),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: Colors.black),
        title: Text(pageRoutes[i].titulo),
        trailing: const Icon(Icons.chevron_right,
            color: Color.fromARGB(255, 165, 165, 101)),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class ModoOscuro extends StatelessWidget {
  const ModoOscuro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return ListTile(
      trailing: Switch.adaptive(
          value: appTheme.darkTheme,
          activeColor: const Color.fromARGB(255, 165, 165, 101),
          onChanged: (value) => appTheme.darkTheme = value),
    );
  }
}
