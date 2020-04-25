import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  final Function _myFun;

  ProductControl(this._myFun);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        _myFun('Hello ');
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('A new Product added'),
              backgroundColor: Colors.deepPurple,
              duration: Duration(seconds: 3),
              elevation: 30,
            )
            
            );
      
      },
      child: Text('Add Product'),
    );
  }
}
