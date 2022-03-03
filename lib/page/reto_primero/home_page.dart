import 'package:flutter/material.dart';
import 'package:flutter_session2/page/reto_primero/controller/home_page_controller.dart';
import 'package:flutter_session2/page/reto_primero/list_page.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RetoAPage extends StatelessWidget {
  RetoAPage({Key? key}) : super(key: key);
  final controller = PageController();
  static const primaryColor = Color(0xFF00512D);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            width: size.width,
            child: Column(
              children: [
                const Spacer(flex: 2),
                SizedBox(
                  height: size.height * 0.5,
                  child: PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(child: infoSlider(size,_.dataBanner[index]['imagen'],_.dataBanner[index]['frase'],_.dataBanner[index]['comentario'] ));
                    },
                    itemCount: _.dataBanner.length,
                  ),
                ),
                Padding(
                  //Indicador de Pagina
                  padding: const EdgeInsets.all(8),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: primaryColor,
                      dotColor: Color(0xFF382E1E),
                      dotHeight: 10,
                      dotWidth: 10,
                      //type: WormType.normal,
                    ),
                  ),
                ),
                const Spacer(),
                botonPrinciapl(context),
                const Spacer(),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/fondo.jpg'),
              ),
              // gradient: LinearGradient(
              //   colors: const [
              //     Color.fromARGB(255, 145, 84, 41),
              //     Color.fromRGBO(215, 158, 111, 1),
              //   ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
            ),
          ),
        );
      },
    );
  }

  Widget infoSlider(Size size,String imagen, String frase, String comentario) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) {
        return Column(
          children: [ // Image.asset(
          //   item['imagen'],
          //   width: size.width / 1.7,
          // ),
          Container(
            width: size.width * 0.7,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagen),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
            child: Text(
             frase,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 65, 42, 19),
                  fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 8,
            ),
            child: Text(
              comentario,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(149, 100, 59, 1)),
            ),
          ),],
        );
      },
    );
  }



  Widget botonPrinciapl(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListPage()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 82, 51, 1),
            borderRadius: BorderRadius.circular(30)),
        child: const Text(
          'Empezar',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
    );
  }
}
