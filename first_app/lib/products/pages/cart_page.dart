import 'package:flutter/material.dart';
import 'package:first_app/products/models/product.dart';
import 'package:first_app/products/widgets/products_cart.dart';

class CartPage extends StatefulWidget {
  final List<Product>? products;

  const CartPage({required this.products, Key? key}) : super(key: key);

  @override
  State<CartPage> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  List<Product> productsCart = [];
  double total = 0;

  @override
  void initState() {
    super.initState();
    productsCart.addAll(widget.products as Iterable<Product>);

    for (var element in productsCart) {
      var subtotal = element.inCar * element.price;
      total += subtotal;
    }
  }

  void deleteAll() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Vaciar todo el carrito!'),
          content: const Text('¿Desea continuar?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Si'),
              onPressed: () {
                setState(() {
                  productsCart = [];
                  total = 0;
                });
                Navigator.of(context).pushNamed('/');
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                return Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
      ),
      body: Column(children: <Widget>[
        Visibility(
            visible: productsCart.isNotEmpty,
            child: ElevatedButton(
                onPressed: () {
                  deleteAll();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(80, 20),
                ),
                child: const Text('Eliminar todo'))),
        Expanded(
            child: ListView.separated(
          itemCount: productsCart.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(productsCart[index].name),
              subtitle: Text(
                  '${productsCart[index].brand} ${productsCart[index].quantity}'),
              trailing: SingleChildScrollView(
                  child: SizedBox(
                      width: 100,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${productsCart[index].inCar} u',
                              )
                            ]),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'S/ ${(productsCart[index].price * productsCart[index].inCar).toStringAsFixed(2)}',
                            )
                          ],
                        )
                      ]))),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 2,
              color: Colors.grey,
            );
          },
        )),
        const Divider(
          color: Colors.blue,
          thickness: 2.0,
        ),
        Row(
          children: [
            const SizedBox(width: 25.0),
            const Text('TOTAL',
                style: TextStyle(
                  fontSize: 25,
                )),
            const SizedBox(width: 150.0),
            Text('S/ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 25,
                ))
          ],
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2.0,
        ),
      ]),
    );
  }
}
