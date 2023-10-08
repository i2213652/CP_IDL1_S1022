import 'package:flutter/material.dart';
import 'package:first_app/widgets/listview_products.dart';

class AppBarProducts extends StatelessWidget {
  const AppBarProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi Bodega Digital',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            height: 100.0,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Lista de productos',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Image.asset(
                  'assets/images/shopping_car.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
          ),
          const Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}
