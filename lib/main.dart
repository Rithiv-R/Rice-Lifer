import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ricelife/Agro/agroshop.dart';
import 'package:ricelife/authentication/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ricelife/authentication/signup.dart';
import 'package:ricelife/classifier/classifier1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Classify();
  }
}
