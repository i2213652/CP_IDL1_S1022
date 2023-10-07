import 'dart:convert';
import 'package:first_app/models/product.dart';
import 'package:flutter/services.dart';

Future<List<Product>> fetchItems() async {
  final jsonString = await rootBundle.loadString('assets/data/products.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((item) => Product.fromJson(item)).toList();
}
