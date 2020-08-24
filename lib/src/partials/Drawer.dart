import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomDrawer({
  BuildContext pageContext,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'DevsTravel',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
              Text(
                'Versão 1.0',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/home');
          },
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text('Escolher Continente'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/continent');
          },
          leading: Icon(
            Icons.public,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text('Buscar Cidade'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/search');
          },
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text('Cidade salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/favorites');
          },
          leading: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
