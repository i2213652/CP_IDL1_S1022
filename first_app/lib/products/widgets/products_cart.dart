import 'package:flutter/material.dart';
import 'package:first_app/products/models/product.dart';

class ProductsCartWidget extends StatefulWidget {
  final List<Product>? products;

  const ProductsCartWidget({required this.products, Key? key})
      : super(key: key);

  @override
  ProductsCartWidgetState createState() => ProductsCartWidgetState();
}

class ProductsCartWidgetState extends State<ProductsCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Widget'),
      ),
      body: Center(
        child: Text('Hello, this is my custom widget!'),
      ),
    );
  }
}
