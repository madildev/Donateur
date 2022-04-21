import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:donteur/modules/bottom_navbar.dart';
import 'package:donteur/pages/get_started.dart';
import 'package:provider/provider.dart';
import 'package:donteur/providers/UserdataProvider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserData())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: const GetStarted(),
    );
  }
}
