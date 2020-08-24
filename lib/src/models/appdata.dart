import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  List data = [];

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
