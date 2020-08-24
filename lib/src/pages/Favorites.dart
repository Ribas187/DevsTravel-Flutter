import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/AppBar.dart';
import 'package:DevsTravel/src/partials/CityBox.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favorites = appdata.getFavorites();

      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Cidades Salvas',
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            favorites.length,
            (index) => CityBox(
              data: favorites[index],
              onTap: (cityData) =>
                  Navigator.pushNamed(context, '/city', arguments: cityData),
            ),
          ),
        ),
      );
    });
  }
}
