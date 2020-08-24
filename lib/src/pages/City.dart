import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPage createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  bool isFavorite = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold,
  );

  void handleGoBack(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;

    List stars = [];
    int starRate = double.parse(cityData['review']).floor();

    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      isFavorite = appdata.isCityFavorite(cityData['name']);

      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        drawer: CustomDrawer(
          pageContext: context,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
              child: Image.network(
                cityData['places'][0]['img'],
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 220),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "${cityData['name']}",
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[0] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[1] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[2] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[3] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color:
                                          stars[4] ? Colors.blue : Colors.grey,
                                      size: 16,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        cityData['review'],
                                        style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: IconButton(
                                icon: Icon(isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                color: Colors.red,
                                onPressed: () => setState(() => isFavorite =
                                    appdata.toggleFavorite(cityData['name']))),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0, left: 15, right: 15, bottom: 10),
                        child: Text(
                          cityData['description'],
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          'PRINCIPAIS PONTOS TURÍSTICOS',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.count(
                        padding: EdgeInsets.only(bottom: footerHeight),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 10 / 11,
                        children: List.generate(
                          cityData['places'].length,
                          (index) => Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        cityData['places'][index]['img'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    cityData['places'][index]['name'],
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Ponto turístico',
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: statusBarHeight),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => handleGoBack(context),
              ),
            ),
          ],
        ),
      );
    });
  }
}
