// ignore_for_file: unused_local_variable

import 'package:flutter_session2/page/reto_primero/providers/list_page_provider.dart';
import 'package:get/get.dart';

class ListPageController extends GetxController {
  bool isSelectedCapuchino = true;
  bool isSelectedCocaCola = false;
  bool isSelectedExpress = false;
  bool isSelected = false;
  List<dynamic> productoPorCategoria = [];

  cambiarEstado(String name, bool isSelectedParam) {
    isSelected = isSelectedParam;
    if (name == 'coffee') {
      isSelectedCapuchino = true;
      isSelectedCocaCola = false;
      isSelectedExpress = false;
    } else if (name == 'liquor') {
      isSelectedCapuchino = false;
      isSelectedCocaCola = true;
      isSelectedExpress = false;
    } else if (name == 'express') {
      isSelectedCapuchino = false;
      isSelectedCocaCola = false;
      isSelectedExpress = true;
    }
    update(['ListViewCategoriaItem','ListView_productoPorCategoria']);
  }

  Future listarProductosPorCategoria(String categoriaNombre) async {
    List<dynamic> opciones = [];
    print(categoriaNombre);
    opciones =
        await listPageProvider.cargarProductosPorCategorias(categoriaNombre);
    opciones.asMap().forEach((index,item) {
      if (item['tipo_categoria'] == categoriaNombre) {
        productoPorCategoria = item['productos'];
      }
    });
    update(['ListView_productoPorCategoria']);
    return productoPorCategoria;
  }

  @override
  void onInit() {
    listarProductosPorCategoria('Capuchino');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
