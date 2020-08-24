import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/AppBar.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Home',
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Bem vindo(a) ao',
                  style: styles,
                ),
              ),
              Image.asset(
                'lib/assets/logo.png',
                width: 200,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Seu guia de viagem perfeito',
                  style: styles,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
