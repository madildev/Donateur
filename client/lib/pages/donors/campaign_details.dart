import 'package:flutter/material.dart';

class CampaignDetails extends StatefulWidget {
  const CampaignDetails({Key? key}) : super(key: key);

  @override
  _CampaignDetailsState createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: const Image(image: AssetImage('/1370675746.png')),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.teal,
                      ),
                      backgroundColor: Colors.white)),
            ),
          ],
        ),
        Expanded(
          //This is the stack to over lap the images
          child:
              //This is the form body
              Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 145.0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(80),
                topLeft: Radius.circular(80),
              ),
              color: Colors.white,
            ),
            child: Column(children: [
              //This is the title of the compaign
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Help Abandoned Animals',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),

              //This is the description of the campaign or the details of the event

              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                            'help the abandoned animals find a shelter by feeding  them and help them find …….  Read more'))
                  ],
                ),
              ),

              //This will be the other details of the event

              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //This container is for Category
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Image(image: AssetImage('/Path_233.png')),
                            Text('Category'),
                            Text('Animal'),
                          ],
                        ),
                      ),

                      //This container is for Time
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Image(image: AssetImage('/Group_274.png')),
                            Text('Days Left'),
                            Text('3'),
                          ],
                        ),
                      ),

                      //This container is for the Number of donations
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Image(image: AssetImage('/Group_275.png')),
                            Text('Donations'),
                            Text('4'),
                          ],
                        ),
                      ),
                    ]),
              ),

              //This Container is for the Moto of the Ngo

              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Anamiliya!!'),
                        Image(image: AssetImage('/XMLID_1958.png'))
                      ],
                    ),
                    Column(
                      children: [
                        Text('Save the Animals!!'),
                      ],
                    ),
                  ],
                ),
              ),

              //This is to create a divider in the screen
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: const Divider(
                  height: 2,
                  color: Colors.black,
                ),
              ),

              //This will show the donation status of the event
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Charity Target!'),
                        Text('19.35/25'),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Donate'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        )
      ],
    ));
  }
}
