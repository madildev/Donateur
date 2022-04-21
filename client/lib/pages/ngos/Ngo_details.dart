import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class NgoDetails extends StatelessWidget {
  const NgoDetails({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Details',
            style: TextStyle(color: Colors.grey),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.grey,
                  ),
                )),
          ],
          backgroundColor: Colors.white,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  // late String valueChoose;
  // String? value;
  File? imageFile;

  int _count = 0;
  String dropdownValue = 'Pick a Category';
  // List _images = [];
  // late File imageFile = File('assets/login.png');
  // final picker = ImagePicker();

  // Future chooseImage() async {
  //   final pickedFile = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, maxWidth: 100, maxHeight: 100);
  //   if (pickedFile != null) {
  //     setState(() {
  //       // _images.add(File(pickedFile.path));
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: ' Campaign Name',
                icon: Icon(Icons.supervised_user_circle_outlined,
                    color: Colors.greenAccent),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: ' Campaign Details',
                  icon:
                      Icon(Icons.menu_book_rounded, color: Colors.greenAccent),
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: ' Contact info',
                  icon:
                      Icon(Icons.contacts_outlined, color: Colors.greenAccent),
                ),
              )),

          //____________________________________________________//
          Padding(
              padding: EdgeInsets.only(left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total Need: ${_count}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_count > 0) {
                          _count--;
                        }
                      });
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _count++;
                      });
                    },
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(44.0, 10.0, 0, 10.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.greenAccent),
              underline: Container(
                height: 2,
                color: Colors.greenAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Pick a Category',
                'Health',
                'Food',
                'Education',
                'Other'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          //________________________________________________//
          Padding(
            padding: const EdgeInsets.fromLTRB(44.0, 10.0, 0, 10.0),
            child: Text(
              'Photos:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(90.0, 10.0, 0, 10.0),
                child: Container(
                    child: imageFile == null
                        ? Container(
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 2,
                              // radius: Radius.circular(8),
                              child: GestureDetector(
                                  onTap: () {
                                    _getFromGallery();
                                  },
                                  child: Icon(Icons.add, color: Colors.grey)),
                            ),
                          )
                        : Container(
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                          )),
              ),
            ],
          ),

          //___________________________________________________________//

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data...'),
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                },
                child: const Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
