import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _HomePageProvider {
  List<dynamic> data = [];

  Future<List<dynamic>> listarBanner() async {
    final response = await rootBundle.loadString('data/splash.json');
    Map dataMap = await json.decode(response);
    data = dataMap['data'];
    return data;
  }
}

final homePageProvider = new _HomePageProvider();

