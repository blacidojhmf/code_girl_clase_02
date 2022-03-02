// ignore_for_file: unused_local_variable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_session2/page/retoA/controller/list_page_controller.dart';
import 'package:flutter_session2/util/icons_utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);
  static const primaryColor = Color(0xFF00512D);
  static const secondaryColor = Color(0xFFCF9F69);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    print('list_page');
    return GetBuilder<ListPageController>(
      init: ListPageController(),
      builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerListPage(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Text(
                      'Buenos dias, Blácido Jhony ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  barraBusqueda(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    child: Text(
                      'Categorías',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  categorias(), //nombre de las categorias
                  _lista(size),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: Text(
                      'Ofertas Espaciales',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 24),
                    ),
                  ),
                  productosOfertas(size),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: primaryColor,
                  size: 30,
                ),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                label: 'Carrito',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Perfil',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget headerListPage() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/user.png'),
            // backgroundImage: NetworkImage(
            //     'https://images.unsplash.com/photo-1640915550677-26ade06905fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on_sharp,
                color: primaryColor,
              ),
              Text(
                'Lima, Perú',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Icon(
            Icons.notifications_none,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget barraBusqueda() {
    return Padding(
      padding: EdgeInsets.only(right: 0, left: 0),
      child: TextField(
        decoration: InputDecoration(
          //imagen busqueda lado izquierdo
          prefixIcon: IconButton(
            icon:  Icon(Icons.search),
            color: Colors.black54,
            iconSize: 30,
            onPressed: (){
              print('buscar');
            },
            
          ),
          suffixIcon: Padding(
            //Imagen de filtro lado derecho
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: secondaryColor,
              child: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 25,
                color: Colors.white,
                onPressed: (){
                  print('filtro');
                },
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(width: 0, style: BorderStyle.none)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: Color.fromARGB(143, 236, 231, 231),
        ),
      ),
    );
  }

  Widget categorias() {
    return GetBuilder<ListPageController>(
      init: ListPageController(),
      builder: (_) {
        return SizedBox(
          height: 60,
          child: GetBuilder<ListPageController>(
            id: 'ListViewCategoriaItem',
            init: ListPageController(),
            builder: (_) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  categoriaItem(
                    'coffee',
                    'Capuchino',
                    _.isSelectedCapuchino,
                  ),
                  categoriaItem(
                    'liquor',
                    'Bebidas',
                    _.isSelectedCocaCola,
                  ),
                  categoriaItem(
                    'express',
                    'Expres',
                    _.isSelectedExpress,
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget categoriaItem(String iconName, String titulo, bool isSelected) {
    print('categoriaItem');
    return GetBuilder<ListPageController>(
      init: ListPageController(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.cambiarEstado(iconName, isSelected);
            _.listarProductosPorCategoria(titulo);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 0, left: 0, top: 4, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.grey.withOpacity(0.3)
                      : Colors.transparent,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: isSelected ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconName == null
                    ? Container()
                    : (getIconCategoria(iconName, isSelected)),
                Text(
                  '  ' + titulo,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _lista(Size size) {
    return GetBuilder<ListPageController>(
      init: ListPageController(),
      id: 'ListView_productoPorCategoria',
      builder: (_) {
        return SizedBox(
          //se envie un lisstview dentro de un sizeBox pq necesita un widget con ancho o alto
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _listaItem(_.productoPorCategoria, size),
          ),
        );
      },
    );
  }

  List<Widget> _listaItem(List<dynamic> data, Size size) {
    List<Widget> opciones = [];
    data.forEach((item) {
      opciones.add(
        Container(
          padding: EdgeInsets.all(3),
          width: 200,
          child: productCategoria(size, item),
        ),
      );
    });
    return opciones;
  }

  Widget productCategoria(Size size, Map item) {
    String imagen = item['imagen'];
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(3, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: size.width / 2 - 24,
        padding: EdgeInsets.all(4),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: size.width / 2 - 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item['imagen']),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 4),
                  child: Text(
                    item['titulo'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    item['descripcion'],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'S/${item['precio']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                  backgroundColor: primaryColor, child: Icon(Icons.add)),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondaryColor.withOpacity(.8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.white),
                    Text(
                      '${item['estrellas']}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productosOfertas(Size size) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            width: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/cafe5.jpg'),
                // image: NetworkImage(
                //     'https://images.unsplash.com/photo-1521495037281-9487183110ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhcHB1Y2lub3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: secondaryColor.withOpacity(.7),
                  ),
                  child: const Text(
                    'Descubrir',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Obtenga tres tazas de té gratis cuando se registre',
                    maxLines: 3,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
