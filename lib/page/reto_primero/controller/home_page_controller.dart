import 'package:flutter_session2/page/reto_primero/providers/home_page_provider.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  List<dynamic> dataBanner = [];
  @override
  void onInit() {
     cargarBanner();
    super.onReady();
    super.onInit();
  }

  @override
  void onReady() {
   
  }

  @override
  void onClose() {
    super.onClose();
  }

  cargarBanner() async {
    dataBanner = await homePageProvider.listarBanner();
    update();
    return dataBanner;
    
  }
}
