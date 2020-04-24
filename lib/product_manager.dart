import 'package:flutter/material.dart';
import 'package:login_register/product_control.dart';
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
  bool b = false;

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

  void _updateProduct(String prod) {
    setState(() {
      i++;
      _products.add(prod + i.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print('This is the build of stateFull');

    return Column(children: [
      Container(
        child: ProductControl(_updateProduct),
        margin: EdgeInsets.all(10.0),
      ),
      Products(_products),
      Switch(value: b, 
      onChanged: (bol){
        setState(() {
          b = bol;
        });
      },
      activeColor: Colors.pink,
      inactiveTrackColor: Colors.black,
      autofocus: true,
      )
    ],
   );
  }
}
