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
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
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
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // contentPadding: EdgeInsets.only(bottom: 0.0),
          title: Text(products[index].name),
          subtitle: Text(products[index].brand),
          isThreeLine: true,
          // trailing: Column(mainAxisSize: MainAxisSize.min, children: [
          //   // Row(children: [Text(products[index].name)]),
          //   Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           // Acción para el botón
          //         },
          //         child: Icon(Icons.add, size: 15.0),
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.green,
          //           minimumSize: Size(30, 30), // Cambia el tamaño aquí
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.add),
          //         onPressed: () {
          //           // Acción para el botón de aumento
          //         },
          //       ),
          //       SizedBox(
          //         width: 30,
          //         child: TextField(
          //           decoration: InputDecoration(
          //             hintText: '0',
          //           ),
          //           keyboardType: TextInputType.number,
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.remove),
          //         onPressed: () {
          //           // Acción para el botón de disminución
          //         },
          //       ),
          //     ],
          //   )
          // ]),

          trailing: SingleChildScrollView(
              child: SizedBox(
                  width: 200,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(children: [Text(products[index].name)]),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción para el botón
                          },
                          child: Icon(Icons.add, size: 15.0),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(30, 30), // Cambia el tamaño aquí
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            // Acción para el botón de aumento
                          },
                        ),
                        SizedBox(
                          width: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '0',
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            // Acción para el botón de disminución
                          },
                        ),
                      ],
                    )
                  ]))),
        );
      },
    );
  }
  // Widget build(BuildContext context) {
  //   return ListView.separated(
  //       itemCount: products.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //             height: 500.0,
  //             child: ListTile(
  //               title: Text(products[index].name),
  //               subtitle: Text(products[index].brand),
  //               tileColor: Colors.white,
  //               onTap: () {},
  //               leading: Image.asset(
  //                 'assets/images/${products[index].img}',
  //                 width: 40,
  //                 height: 40,
  //               ),
  //               trailing: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text('S/ ${products[index].price.toStringAsFixed(2)}'),
  //                     Container(
  //                       width: 30.0, // Adjust the width to change the size
  //                       height: 30.0, // Adjust the height to change the size
  //                       // Adjust the width as needed
  //                       decoration: const BoxDecoration(
  //                         color: Colors
  //                             .green, // Set the background color of the button
  //                         shape: BoxShape.circle, // Adjust the radius as needed
  //                       ),
  //                       child: IconButton(
  //                         icon: const Icon(Icons.add, size: 15.0), // Adj),
  //                         color: Colors.white, // Set the color of the icon
  //                         onPressed: () {
  //                           // Custom action when the button is pressed
  //                           print('Button pressed');
  //                         },
  //                       ),
  //                     ),
  //                   ]),
  //             ));
  //       },
  //       separatorBuilder: (BuildContext context, int index) => const Divider(
  //             color: Colors.white,
  //           ));
  // }
}
