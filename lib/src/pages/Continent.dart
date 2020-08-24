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
                    FlatButton(
                      child: Text(
                          '${appdata.data[index]['name']} (${cities.length})'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('Ver cidades'),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex) {
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: (cityData) {
                          print(cityData['name']);
                        },
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
