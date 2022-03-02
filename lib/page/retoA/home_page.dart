import 'package:flutter/material.dart';
import 'package:flutter_session2/page/retoA/list_page.dart';

class RetoAPage extends StatelessWidget {
  const RetoAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          children: [
            const Spacer(flex: 2),
            SizedBox(
              height: size.height * 0.5,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(child: infoSlider(size));
                },
                itemCount: 3,
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
  }

  Widget infoSlider(Size size) {
    return Column(
      children: [
        Image.asset(
          'assets/coffee.png',
          width: size.width / 1.7,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
          child: Text(
            'Café tan bueno,\n que lo vas amar \n cuando lo pruebes',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900,color: Color.fromARGB(255, 65, 42, 19),fontFamily: 'Montserrat'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
          child: Text(
            'El mejor grano, el tueste ma fino, \n el sabor más potente',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Color.fromRGBO(149, 100, 59, 1)),
          ),
        )
      ],
    );
  }

  Widget botonPrinciapl(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  ListPage()));
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
