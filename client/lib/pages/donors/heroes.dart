import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:donteur/modules/bottom_navbar.dart';
import 'package:donteur/modules/search_bar.dart';
import 'package:donteur/modules/ngo_box.dart';
import 'package:donteur/pages/donors/donor_page.dart';

class Heroes extends StatefulWidget {
  const Heroes({Key? key}) : super(key: key);

  @override
  _HeroesState createState() => _HeroesState();
}

class _HeroesState extends State<Heroes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Our Heros',
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(child: SearchBar()),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    NgoBox(
                        Ngoimage: 'jungle.png',
                        daysLeft: 2,
                        NeedLeft: 50,
                        compaingTitle: 'Donate for Animals',
                        percentage: .9),
                    SizedBox(
                      height: 15,
                    ),
                    NgoBox(
                        Ngoimage: 'jungle.png',
                        daysLeft: 2,
                        NeedLeft: 50,
                        compaingTitle: 'Donate for Animals',
                        percentage: .9),
                    SizedBox(
                      height: 15,
                    ),
                    NgoBox(
                        Ngoimage: 'jungle.png',
                        daysLeft: 2,
                        NeedLeft: 50,
                        compaingTitle: 'Donate for Animals',
                        percentage: .9),
                    SizedBox(
                      height: 15,
                    ),
                    NgoBox(
                        Ngoimage: 'jungle.png',
                        daysLeft: 2,
                        NeedLeft: 50,
                        compaingTitle: 'Donate for Animals',
                        percentage: .9),
                    SizedBox(
                      height: 15,
                    ),
                    NgoBox(
                        Ngoimage: 'jungle.png',
                        daysLeft: 2,
                        NeedLeft: 50,
                        compaingTitle: 'Donate for Animals',
                        percentage: .9),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
