import 'package:flutter/material.dart';
import 'package:login_register/product_manager.dart';
import 'package:login_register/profile_page.dart';

void main() => runApp(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => new ProfilePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello BG')),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  child: Text('Click Here'),
                ),
                ProductManager(startIngProduct: 'Food Tester'),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(1.0),
                      bottomLeft: Radius.circular(1.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    child: Align(
                      alignment: Alignment.center, //change center if you want
                      heightFactor: 0.75,
                      widthFactor: 0.75,
                      child: new Image.network(
                        "https://bit.ly/2lNRWYk",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                    child: Image.network("https://bit.ly/2lZu0RG"),
                  ),
                ),
              ],
            )));

    //  ProductManager(startIngProduct: 'Food Tester')));
  }
}

// class AssignMent extends StatefulWidget {
//   @override
//   _AssignMentState createState() => _AssignMentState();
// }

// class _AssignMentState extends State<AssignMent> {

// String _text = '' ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('This is Assignment'),
//         centerTitle: true,
//         elevation: 50,
//         toolbarOpacity: 0.5,
//       ),
//       body: Center(child: Column(
//         children: <Widget>[
//           RaisedButton(onPressed: () {
//             setState(() {
//               _text = 'Hello Button Pressed';
//             });
//           },
//           child: Text('Click Here to change the text'),),
//           Text(_text,style: TextStyle(color: Colors.white,backgroundColor: Colors.black,fontStyle: FontStyle.italic,fontSize: 30),)
//         ],
//       ),),
//     );
//   }
// }
