import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _ListPageProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarProductosPorCategorias(String categoria) async {
    final response = await rootBundle.loadString('data/categorias.json');
    Map dataMap = json.decode(response);
    opciones = dataMap['data'];
    return opciones;
  }
}

final listPageProvider = new _ListPageProvider();
