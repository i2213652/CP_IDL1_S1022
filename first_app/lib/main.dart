import 'package:flutter/material.dart';
import 'package:first_app/widgets/appbar_products.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppBarProducts(),
    );
  }
}
