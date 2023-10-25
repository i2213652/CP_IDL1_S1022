import 'package:flutter/material.dart';
import 'package:first_app/models/product.dart';

class CartProductsWidget extends StatefulWidget {
  final List<Product> cart;
  final Function(List<Product>) updateCart;

  const CartProductsWidget(
      {Key? key, required this.cart, required this.updateCart})
      : super(key: key);

  @override
  CartProductsWidgetState createState() => CartProductsWidgetState();
}

class CartProductsWidgetState extends State<CartProductsWidget> {
  List<Product> productsCart = [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    productsCart.addAll(widget.cart);

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
                  widget.updateCart(productsCart);
                });

                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Cierra la alerta
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                return Navigator.of(context).pop(); // Cierra la alerta
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
              child: Text('Eliminar todo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(80, 20),
              ),
            )),
        Expanded(
            child: ListView.separated(
          itemCount: productsCart.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // contentPadding: EdgeInsets.only(bottom: 0.0),
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
            // Construye el separador entre elementos
            return const Divider(
              height:
                  2, // Personaliza la altura del separador según tus necesidades
              color: Colors.grey,
            );
          },
        )),
        const Divider(
          color: Colors
              .black, // Cambia el color de la línea según tus preferencias
          thickness: 2.0, // Cambia el grosor de la línea según tus preferencias
        ),
        Row(
          children: [
            const SizedBox(width: 50.0),
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
        )
      ]),
    );
  }
}
