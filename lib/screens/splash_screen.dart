import 'dart:async';
import 'package:azercell_mobile_app/screens/cards_screens/create_card_screen.dart';
import 'package:azercell_mobile_app/screens/cards_screens/master_card.dart';
import 'package:azercell_mobile_app/screens/create_customer_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }


  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => (cardBox.isEmpty && box.isEmpty) ? CreateCustomerScreen() :
          cardBox.isEmpty ?
          CreateCardScreen() : MasterCard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  Image.asset(
          'assets/images/applogo512.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
