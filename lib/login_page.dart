import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginState(),
    );
  }
}

class LoginState extends StatefulWidget {
  
  @override
  _LoginStateState createState() => _LoginStateState();
}


String email = '', password = '';

class _LoginStateState extends State<LoginState> {
  String emailerrm, passerrm;

  @override
  Widget build(BuildContext context) {

 
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(36.0),
      child: Center(
          child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                email = value;
                setState(() {
                  if (_isEmail(value)) {
                    email = value;
                    emailerrm = null;
                  } else if (value.isEmpty) {
                    emailerrm = 'This can not be empty';
                    email = '';
                  } else if (!_isEmail(value)) {
                    email = '';
                    emailerrm = 'Please Enter a valid email';
                  }
                });
              },
              autofocus: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  counterStyle: TextStyle(fontSize: 100),
                  labelText: 'Email',
                  errorMaxLines: 1,
                  errorText: emailerrm,
                  // errorBorder: InputBorder(borderSide: BorderSide(color: Colors.red,width: 5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                errorMaxLines: 1,
                errorText: passerrm,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.length > 3) {
                    password = value;
                    passerrm = null;
                  } else if (value.isEmpty) {
                    passerrm = 'This Field cann\'t be empty';
                    password = '';
                  } else {
                    passerrm = 'Min length is 4';
                    password = '';
                  }
                });
              },
              obscureText: true,
              enableSuggestions: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            RaisedButton(
              onPressed: () async {
                if (email.isNotEmpty && password.isNotEmpty) {
                  print('$email $password');
                  final http.Response response = await http.post(
                    'http://35.238.255.212:3001/api/login',
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(
                        <String, String>{'email': email, 'password': password}),
                  );
                  if (response.statusCode == 201) {
                    print(json.decode(response.body));
                  } else {
                    // Future<User> user = login(email, password);
                    // user.then((value) => print('this is from ${value.id}'));

                    var data = json.decode(response.body)[0];
                    if (data != 'No User Found') {
                      print(' ${data['_id']} $data');
                    } else {
                      print('$data');
                    }
                  }
                  // Future<http.Response> res = login(email, password);
                  // print(res.toString());
                } else {
                  
                  // Scaffold.of(mykey.currentContext).showSnackBar(
                  //   SnackBar(content: Text('Please Fill the Form Correctly'),)
                  // );
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      )),
    ));
  }

  bool _isEmail(String value) {
    bool b;
    b = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return b;
  }

  
}


class User {
  final String id;
  final String fullname, email;

  User({this.id, this.fullname, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'], fullname: json['fullname'], email: json['email']);
  }
}

Future<User> login(String email, String pass) async {
  final http.Response response = await http.post(
    'http://35.238.255.212:3001/api/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': pass}),
  );
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body)[0]);
  } else {
    print('Some Error');
  }
}
