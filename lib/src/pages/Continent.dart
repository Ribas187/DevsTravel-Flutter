import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/AppBar.dart';
import 'package:DevsTravel/src/partials/CityBox.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold,
  );

  void handleSeeCities(context, continentIndex) {
    Navigator.pushNamed(context, '/listCities', arguments: continentIndex);
  }

  void handleCityBox(context, cityData) {
    Navigator.pushNamed(context, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente',
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            List cities = [];

            for (var country in appdata.data[index]['countries']) {
              cities.addAll(country['cities']);
            }

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        '${appdata.data[index]['name']} (${cities.length})',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Ver mais cidades',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue',
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () => handleSeeCities(context, index),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (cityContext, cityIndex) {
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: (cityData) => handleCityBox(context, cityData),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
