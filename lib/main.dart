import 'package:flutter/material.dart';
import 'package:login_register/product_manager.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialApp ma = MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Hello BG')),
          body: ProductManager(startIngProduct : 'Food Tester') 
          )
    );
    return ma;
  }
}

