import 'package:flutter/material.dart';
import 'package:first_app/products/models/product_model.dart';

import 'package:first_app/products/services/api_products_service.dart';
import 'package:first_app/products/models/error_service_model.dart';
import 'package:http/http.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key}) : super(key: key);

  @override
  ProductsListWidgetState createState() => ProductsListWidgetState();
}

class ProductsListWidgetState extends State<ProductsListWidget> {
  List<ProductModel> products = [];
  List<ProductModel> productsCart = [];
  late APIProductService apiService;

  @override
  void initState() {
    super.initState();
    apiService = APIProductService(Client());
    fetchData();
  }

  _navigateToCart(BuildContext context) {
    if (productsCart.isNotEmpty) {
      Navigator.of(context).pushNamed('/cart', arguments: productsCart);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('¡Ups!'),
            content:
                const Text('Debes agregar al menos un producto al carrito'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> fetchData() async {
    var response = await apiService.getProducts(null);

    if (response is List<ProductModel>) {
      setState(() {
        products = response;
      });
    } else if (response is ErrorServiceModel) {
      print(response);
    }
  }

  void incrementValue(String id) {
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

  void decrementValue(String id) {
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

  void addCart(String id) {
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
                        Navigator.of(context).pop();
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
                                child: const Icon(Icons.check, size: 15.0),
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
      const Divider(
        color: Colors.green,
        thickness: 2.0,
      ),
      ElevatedButton(
          onPressed: () {
            _navigateToCart(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(50, 50),
          ),
          child: const Icon(Icons.shopping_cart, size: 20.0)),
      const Divider(
        color: Colors.green,
        thickness: 2.0,
      ),
    ]);
  }
}
