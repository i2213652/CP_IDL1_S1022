import 'package:flutter/material.dart';
import 'package:first_app/products/models/product_model.dart';
import 'package:first_app/products/widgets/products_cart.dart';

class CartPage extends StatefulWidget {
  final List<ProductModel>? products;

  const CartPage({required this.products, Key? key}) : super(key: key);

  @override
  State<CartPage> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carrito de compras'),
        ),
        body: ProductsCartWidget(products: widget.products));
  }
}
