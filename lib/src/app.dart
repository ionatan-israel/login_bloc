import 'package:flutter/material.dart';
import 'package:login_boc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log Me In',
      home: Scaffold(
        body: SafeArea(
          child: LoginScreen(),
        ),
      ),
    );
  }
}