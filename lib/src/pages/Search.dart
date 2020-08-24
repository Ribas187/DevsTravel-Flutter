import 'package:DevsTravel/src/models/appdata.dart';
import 'package:DevsTravel/src/partials/AppBar.dart';
import 'package:DevsTravel/src/partials/CityBox.dart';
import 'package:DevsTravel/src/partials/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  List list = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void handleSearch(context, text) async {
    List newList =
        await Provider.of<AppData>(context, listen: false).searchCity(text);

    setState(() => list = newList);
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
            title: 'Busque uma cidade',
            hideSearch: true,
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (text) => handleSearch(context, text),
                  decoration: InputDecoration(
                    hintText: 'Digite o nome de uma cidade',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    list.length,
                    (index) => CityBox(
                      data: list[index],
                      onTap: (cityData) => Navigator.pushNamed(context, '/city',
                          arguments: cityData),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
