import 'package:flutter/material.dart';
import 'package:login_register/products.dart';

class ProductManager extends StatefulWidget {
  final String startIngProduct;

  ProductManager({this.startIngProduct});

  @override
  State<ProductManager> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  int i = 0;

  @override
  void initState() {
    print('this is init');
    _products.add(widget.startIngProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('Widget Updated');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    print('This is the build of stateFull');

    return Column(children: [
      Container(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              i++;
              _products.add('NewLy Added ' + i.toString());
            });
          },
          child: Text('Add Product'),
        ),
        margin: EdgeInsets.all(10.0),
      ),
      Products(_products)
    ]);
  }
}
