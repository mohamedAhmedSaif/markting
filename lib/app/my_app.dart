import 'package:flutter/material.dart';
import 'package:proo/view/resources/fingerprint.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: FingerprintScreen());
  }
}
