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
            color: Colors.black, // Text color
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            height: 100.0, // Set the desired height
            color: Colors.green, // Background color of the container
            // child: const Center(
            //   child: Text(
            //     'Lista de productos',
            //     style: TextStyle(
            //       fontSize: 24.0,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Lista de productos',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Image.asset(
                  'assets/images/shopping_car.png', // Path to the image asset
                  width: 100.0, // Set the desired width for the image
                  height: 100.0, // Set the desired height for the image
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
