import 'package:flutter/material.dart';
import 'package:first_app/products/pages/home_page.dart';
import 'package:first_app/router_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
      title: 'JSON ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
