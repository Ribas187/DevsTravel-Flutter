import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/AppBar.dart';
import 'package:DevsTravel/src/partials/CityBox.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCitiesPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold,
  );

  void handleCityBox(context, cityData) {
    Navigator.pushNamed(context, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List cities = [];

      for (var country in appdata.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }

      return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title:
                "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            showBack: true,
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              cities.length,
              (index) => CityBox(
                data: cities[index],
                onTap: (cityData) => handleCityBox(context, cityData),
              ),
            ),
          ));
    });
  }
}
