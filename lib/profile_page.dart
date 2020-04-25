import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_register/login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // return new MaterialApp(
    //   home:
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyOwnClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 47, 47),
              ),
              height: MediaQuery.of(context).size.height * .8,
            ),
          ),
          ClipPath(
            clipper: MyClip(),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 58, 75),
                // gradient: new LinearGradient(
                //     colors: [Colors.deepPurple, Colors.red],
                //     begin: const FractionalOffset(0.0, 0.0),
                //     end: const FractionalOffset(1.0, 0.0),
                //     stops: [0.1, 1.0],
                //     tileMode: TileMode.clamp),
              ),
              height: MediaQuery.of(context).size.height * .8,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12,
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('WELCOME!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Nice to see you again!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            color: Colors.white,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color.fromARGB(255, 172, 47, 47),
                                fontSize: 37,
                              ),
                            ),
                            onPressed: () {
                              print('Login Tapped');
                              Navigator.push(
                                  context,  
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          // rgb(246, 232, 232)
          Positioned(
              bottom: 25,
              left: 10,
              child: SafeArea(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Not a Member? ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 176, 171, 171),
                        fontSize: 22,
                      )),
                  InkWell(
                    onTap: () {
                      print('Go to Resiter Page');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 172, 47, 47),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )))
        ],
      ),
    );
    //   ,
    // );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = new Path();
    path.lineTo(0.0, h * 4.5 / 8);
    path.quadraticBezierTo(w * 1 / 3, h * 7 / 8, w * 0.85, h * 6.15 / 8);
    path.quadraticBezierTo(w * 1.23 / 3, h * 6.5 / 8, w * 0.2, h * 0.55);
    path.quadraticBezierTo(w * .7, h * 0.5, w, h * 0.3);
    // path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MtClipWithCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(0.0, size.height - 150);
    p.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 150);
    p.lineTo(size.width, 0.0);
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// class ClipPainter extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var height = size.height;
//     var width = size.width;
//     var path = new Path();

//     path.lineTo(0, size.height);
//     path.lineTo(size.width, height);
//     path.lineTo(size.width, 0);

//     /// [Top Left corner]
//     var secondControlPoint = Offset(0, 0);
//     var secondEndPoint = Offset(width * .2, height * .3);

//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     /// [Left Middle]
//     var fifthControlPoint = Offset(width * .3, height * .5);
//     var fiftEndPoint = Offset(width * .23, height * .6);
//     path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
//         fiftEndPoint.dx, fiftEndPoint.dy);

//     /// [Bottom Left corner]
//     var thirdControlPoint = Offset(0, height);
//     var thirdEndPoint = Offset(width, height);
//     path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
//         thirdEndPoint.dx, thirdEndPoint.dy);

//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class MyOwnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path p = new Path();
    p.lineTo(0, size.height - 50);
    p.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 30);
    p.quadraticBezierTo(
        size.width * 0.75, size.height - 60, size.width, size.height * 6 / 8);
    p.lineTo(size.width, size.height * 6 / 8 - 50);
    p.quadraticBezierTo(w * 0.5, h * 0.75, w * 0.3, h * 0.58);
    p.quadraticBezierTo(w * .75, h * 0.55, w, h * 0.4);
    p.lineTo(size.width, 0);

    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
