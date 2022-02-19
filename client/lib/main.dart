import 'package:donteur/pages/choice.dart';
import 'package:donteur/pages/donor_signup.dart';
import 'package:flutter/material.dart';
import 'package:donteur/pages/ngo_signup.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Choice(),
        '/donor_signup': (context) => DonorSignUp(),
        '/ngo_signup': (context) => NgoSignUp(),
      }));
}
