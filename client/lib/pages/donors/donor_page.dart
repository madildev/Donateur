import 'package:donteur/pages/donors/campaign_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:donteur/modules/ngo_box.dart';
import 'package:donteur/modules/category_row.dart';
import 'package:donteur/pages/donors/heroes.dart';
import 'package:donteur/pages/login_page.dart';
import 'package:donteur/providers/UserdataProvider.dart';
import 'package:provider/provider.dart';

class DonorPage extends StatefulWidget {
  DonorPage({
    Key? key,
    //required this.response,
  }) : super(key: key);

  @override
  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .1),
        child: AppBar(
          backgroundColor: Colors.teal,
          title: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: SizedBox(
              height: 80,
              child: ListTile(
                title: Text(
                  "Hey, ${context.watch<UserData>().getUserName}",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  "let's spread some goodness",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.arrow_back),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                leading: Icon(Icons.subdirectory_arrow_left),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .06,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'Categories',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .9,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryRow(imageUrl: 'child.png', category: 'Orphans'),
                  SizedBox(
                    width: 20,
                  ),
                  CategoryRow(imageUrl: 'animal.png', category: 'Animals'),
                  SizedBox(
                    width: 20,
                  ),
                  CategoryRow(imageUrl: 'health.png', category: 'Health'),
                  SizedBox(
                    width: 20,
                  ),
                  CategoryRow(imageUrl: 'education.png', category: 'Education'),
                  SizedBox(
                    width: 20,
                  ),
                  CategoryRow(imageUrl: 'food.png', category: 'Food'),
                  SizedBox(
                    width: 20,
                  ),
                  CategoryRow(imageUrl: 'forest.png', category: 'Forest'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Trending',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Heroes()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'More',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CampaignDetails()));
                                  },
                                  child: NgoBox(
                                      Ngoimage: 'jungle.png',
                                      daysLeft: 2,
                                      NeedLeft: 50,
                                      compaingTitle: 'Donate for Animals',
                                      percentage: .9)),
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
                    // BottomNav(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
