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
  List<Product> products_car = [];

  @override
  void initState() {
    super.initState();
    fetchItems().then((products) {
      setState(() {
        this.products = products;
      });
    });
  }

  void incrementValue(int id) {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          if (products[i].inCar + 1 > products[i].stock) {
            products[i].inCar = products[i].stock;
          } else {
            products[i].inCar += 1;
          }
          break;
        }
      }
    });
  }

  void decrementValue(int id) {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          if (products[i].inCar - 1 < 0) {
            products[i].inCar = 0;
          } else {
            products[i].inCar -= 1;
          }
          break;
        }
      }
    });
  }

  void addCar(int id) {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          products_car.add(products[i]);
          break;
        }
      }
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
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'S/ ' + products[index].price.toStringAsFixed(2),
                      )
                    ]),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            incrementValue(products[index].id);
                          },
                        ),
                        SizedBox(
                          width: 30,
                          child: Center(
                              child: Text(
                            products[index].inCar.toString(),
                          )),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            decrementValue(products[index].id);
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Pantalla2(),
                              ),
                            );
                          },
                          child: Icon(Icons.shopping_cart, size: 15.0),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(30, 30),
                          ),
                        ),
                        Text(products[index].inCar.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2.0,
                                wordSpacing: 5.0,
                                backgroundColor:
                                    Color.fromARGB(209, 204, 202, 202)))
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

class Pantalla2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: Center(
        child: Text('Estás en Pantalla 2'),
      ),
    );
  }
}
