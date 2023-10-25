import 'package:flutter/material.dart';
import 'package:first_app/services/product_service.dart';
import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/cart_products.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  ProductListWidgetState createState() => ProductListWidgetState();
}

class ProductListWidgetState extends State<ProductListWidget> {
  List<Product> products = [];
  List<Product> productsCart = [];

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

  void addCart(int id) {
    setState(() {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == id) {
          if (products[i].inCar > 0) {
            productsCart.add(products[i]);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('¡Ups!'),
                  content: const Text('La cantidad debe ser mayor a 0.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra la alerta
                      },
                    ),
                  ],
                );
              },
            );
          }

          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // contentPadding: EdgeInsets.only(bottom: 0.0),
            title: Text(products[index].name),
            subtitle:
                Text('${products[index].brand} ${products[index].quantity}'),
            isThreeLine: true,

            trailing: SingleChildScrollView(
                child: SizedBox(
                    width: 180,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'S/ ${products[index].price.toStringAsFixed(2)}',
                            )
                          ]),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: !productsCart.any(
                                (objeto) => objeto.id == products[index].id),
                            child: Row(children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  decrementValue(products[index].id);
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
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  incrementValue(products[index].id);
                                },
                              ),
                            ]),
                          ),
                          Visibility(
                              visible: !productsCart.any(
                                  (objeto) => objeto.id == products[index].id),
                              child: ElevatedButton(
                                onPressed: () {
                                  addCart(products[index].id);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(30, 30),
                                ),
                                child:
                                    const Icon(Icons.shopping_cart, size: 15.0),
                              )),
                          Visibility(
                              visible: productsCart.any(
                                  (objeto) => objeto.id == products[index].id),
                              child: Text(products[index].inCar.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: 2.0,
                                      wordSpacing: 5.0,
                                      backgroundColor:
                                          Color.fromARGB(209, 204, 202, 202)))),
                        ],
                      )
                    ]))),
          );
        },
      )),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartProductsWidget(cart: productsCart),
            ),
          );
        },
        child: Icon(Icons.shopping_cart, size: 20.0),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(50, 50),
        ),
      ),
    ]);
  }
}
