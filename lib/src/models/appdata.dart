import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  List data = [];
  List favorites = [];

  List getFavorites() {
    List result = [];

    favorites.forEach((favorite) {
      List foundCities = this.searchCity(favorite);
      if (foundCities.length > 0) {
        result.add(foundCities[0]);
      }
    });

    return result;
  }

  List searchCity(String text) {
    List result = [];

    text = text.trim().toLowerCase();

    if (text == '') {
      return [];
    }

    data.forEach((continents) {
      continents['countries'].forEach((country) {
        country['cities'].forEach((city) {
          if (city['name'].toLowerCase().contains(text)) {
            result.add(city);
          }
        });
      });
    });

    return result;
  }

  bool isCityFavorite(cityName) {
    return favorites.contains(cityName);
  }

  bool toggleFavorite(cityName) {
    if (this.isCityFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    }

    favorites.add(cityName);
    return true;
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get('https://api.b7web.com.br/flutter1wb');

    if (res.statusCode != 200) {
      return false;
    }

    setData(jsonDecode(res.body));

    return true;
  }
}
