import 'package:flutter/material.dart';
import 'package:donteur/modules/bottom_navbar.dart';
import 'package:donteur/pages/get_started.dart';
import 'package:donteur/pages/choice.dart';
import 'package:provider/provider.dart';
import 'package:donteur/providers/UserdataProvider.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  String? storedPassword;
  dynamic response;
  dynamic json_response;
  Future<void> makePostRequest() async {
    final url = Uri.parse('http://localhost:3000/login_user');
    final headers = {"Content-type": "application/json"};
    final json = '{ "email": "$email", "password": "$storedPassword"}';
    response = await post(url, headers: headers, body: json);
    print("This is the response send by server!!");
    print(response.body);
    json_response = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(children: [
          Positioned(
              top: -200,
              left: -140,
              child: Image.asset(
                'Group.png',
              )),
          Positioned(
              left: 20,
              top: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStarted()));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              )),
          Positioned(
              top: 130,
              right: 0,
              child: Image.asset(
                'killua.png',
                width: 200,
                height: 200,
              )),
          Positioned(
              top: 180,
              left: 20,
              child: Text(
                'Welcome\nBack',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              )),
        ]),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .7,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Email'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          storedPassword = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: IconButton(
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    await makePostRequest();
                                    if (json_response?.isNotEmpty ?? true) {
                                      //This sets the data into the UserProvider Class
                                      print(
                                          'This is the true part of the statement!!');
                                      context
                                          .read<UserData>()
                                          .setUserData(json_response);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNav()));
                                    } else {
                                      const snackBar = SnackBar(
                                        content: Text('User Does not Exist!!'),
                                      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward_sharp,
                                )))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Choice()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                        Text(
                          'Forget password?',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
