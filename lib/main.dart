import 'package:flutter/material.dart';
import 'package:flutter_ezzat_task/screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        canvasColor: Colors.black

      ),
      home: SignInScreen(),
    );
  }
}

