import 'dart:convert';
import 'package:donteur/modules/bottom_navbar.dart';
import 'package:donteur/pages/donors/donor_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DonorSignUp extends StatefulWidget {
  const DonorSignUp({Key? key}) : super(key: key);

  @override
  DonorSignUpState createState() {
    return DonorSignUpState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class DonorSignUpState extends State<DonorSignUp> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  String? Username;
  String? Email;
  String? Password;
  Map? json_response;

//This function is used to make the requesst for submitting the user inforamtion
  Future<void> makePostRequest() async {
    final url = Uri.parse('http://localhost:3000/register_user');
    final headers = {"Content-type": "application/json"};
    final json =
        '{"user_name": "$Username", "email": "$Email", "password": "$Password","type": "Donor"}';
    final response = await post(url, headers: headers, body: json);
    print(response.body);
    json_response = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: const Color.fromRGBO(87, 169, 154, 1.0),
      body: Column(
        children: [
          //This is the back arrow container
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 40.0),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text(''),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              )
            ],
          ),

          //This is the container where the form is placed
          Expanded(
            //This is the stack to over lap the images
            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.topCenter,
              fit: StackFit.loose,
              children: [
                //This is the form body
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              'Lets Get Started',
                              style: TextStyle(
                                fontSize: 30,
                                color: const Color.fromRGBO(87, 169, 154, 1.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Enter your Username',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username cannot be empty';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  Username = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty!!';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  Email = value;
                                });
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Enter your Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty!!!';
                                }
                                if (value.length < 8) {
                                  return 'Password must be atleast of 8 Charaters!!';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  Password = value;
                                });
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Confirm your Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty!!!';
                                }
                                if (value.length < 8) {
                                  return 'Password must be atleast of 8 Charaters!!';
                                }
                                if (value != Password) {
                                  return 'Password does not match!!';
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 150.0, top: 40.0),
                                    child: ElevatedButton(
                                      child: const Text('Submit'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(87, 169, 154, 1.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        // It returns true if the form is valid, otherwise returns false
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a Snackbar.
                                          makePostRequest();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BottomNav()));
                                        }
                                      },
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //This is the image
                const Positioned(
                  top: -50,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('./Signup.png'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
