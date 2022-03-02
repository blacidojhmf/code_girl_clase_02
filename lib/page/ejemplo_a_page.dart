import 'package:flutter/material.dart';
import 'package:flutter_session2/util/icons_utils.dart';

class EjemploAPage extends StatelessWidget {
  const EjemploAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: double.infinity,
          height: 220,
          child: Center(
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Strawberry ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ac justo quis urna lacinia semper nec eu dui. Maecenas ut blandit mi, ac"),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 201, 41, 174),
                                        size: 15,
                                      ),
                                      Icon(Icons.star,
                                          color:
                                              Color.fromARGB(255, 201, 41, 174),
                                          size: 15),
                                      Icon(Icons.star,
                                          color:
                                              Color.fromARGB(255, 201, 41, 174),
                                          size: 15),
                                      Icon(Icons.star,
                                          color: Colors.black, size: 15),
                                      Icon(Icons.star,
                                          color: Colors.black, size: 15),
                                    ],
                                  ),
                                  Text(
                                    "170 Previews",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  seccionFooter("library_add_check",
                                      Colors.amber, "PREP- \n 25 min"),
                                  seccionFooter(
                                      "alarm", Colors.amber, "COOK: \n 1hr"),
                                  seccionFooter("bookmark_border", Colors.amber,
                                      "FEEDS: \n 4-6"),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                scale: 1,
                                image: NetworkImage(
                                    "https://picsum.photos/250?image=9"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget seccionFooter(String icono, Color color, String texto) {
    return Column(
      children: [
        IconButton(
          onPressed: null,
          icon: getIcon(icono, color),
        ),
        Text(
          "FEEDS: \n 4-6",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.0, color: color),
        ),
      ],
    );
  }
}
