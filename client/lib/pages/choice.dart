import 'package:donteur/pages/donors/donor_signup.dart';
import 'package:donteur/pages/ngos/ngo_signup.dart';
import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(87, 169, 154, 1.0),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text(''),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Who Are You',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('/Donor.png'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonorSignUp()));
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(2.0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Donor',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(87, 169, 154, 1.0)),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NgoSignUp()));
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(2.0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Text('Ngo',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(87, 169, 154, 1.0)))),
                  ),
                  const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('/Ngo.png'),
                  ),
                ],
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/donor_signup');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(226, 125, 96, 1.0)),
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text('Next',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ))),
                  ),
                ],
              ),
              */
            ],
          ),
        ));
  }
}
