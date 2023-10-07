import 'package:flutter/material.dart';
import 'package:first_app/services/product_service.dart';
import 'package:first_app/models/product.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  ProductListWidgetState createState() => ProductListWidgetState();
}

class ProductListWidgetState extends State<ProductListWidget> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchItems().then((products) {
      setState(() {
        this.products = products;
      });
    });
  }

  @override
// Widget build(BuildContext context) {

//   return ListView.builder(
//     itemCount: products.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(products[index].name),
//         // You can customize how each item is displayed here
//       );
//     },
//   );
// }

  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].brand),
            tileColor: Colors.white,
            onTap: () {},
            leading: Image.asset(
              'assets/images/${products[index].img}', // Path to the image asset
              width: 40, // Set the desired width for the image
              height: 40, // Set the desired height for the image
            ),
            trailing: Text('S/ ${products[index].price.toStringAsFixed(2)}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              color: Colors.white,
            ));
  }
}


// class ListviewProducts extends StatelessWidget {
//   const ListviewProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: const Text('Flutter Mapp'),
//           tileColor: Colors.green,
//           onTap: () {},
//           leading: const Icon(Icons.person),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(
//         color: Colors.white,
//       ),
//     );
//   }
// }
