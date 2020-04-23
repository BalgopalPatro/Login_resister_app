import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;
  Products(this.products){
    print('this is product Constructor');
  }

  @override
  Widget build(BuildContext context) {
print('this is the Build()');

    return Column(
      children: products
          .map(
            (ele) => Card(
              elevation: 10,
              borderOnForeground: true,
              child: Column(
                children: <Widget>[Image.asset('assets/army.jpg'), Text(ele)],
              ),
            ),
          )
          .toList(),
    );
  }
}
