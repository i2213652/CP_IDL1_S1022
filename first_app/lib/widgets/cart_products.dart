import 'package:flutter/material.dart';
import 'package:first_app/models/product.dart';

class CartProductsWidget extends StatefulWidget {
  final List<Product> cart;

  const CartProductsWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  CartProductsWidgetState createState() => CartProductsWidgetState();
}

class CartProductsWidgetState extends State<CartProductsWidget> {
  List<Product> productsCart = [];

  @override
  void initState() {
    super.initState();
    productsCart.addAll(widget.cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: productsCart.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // contentPadding: EdgeInsets.only(bottom: 0.0),
              title: Text(productsCart[index].name),
              subtitle: Text(
                  '${productsCart[index].brand} ${productsCart[index].quantity}'),
              isThreeLine: true,

              trailing: SingleChildScrollView(
                  child: SizedBox(
                      width: 250,
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
        ))
      ]),
    );
  }
}
