import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function _myFun;
  ProductControl(this._myFun);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed:() => _myFun('Hello '),
      child: Text('Add Product'),
    );
  }
}
