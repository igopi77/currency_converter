import 'package:currency_converter/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverter());
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "CURRENCY CONVERTER",
      theme: ThemeData(
        fontFamily: 'DMSans',
        primaryColor: Colors.pink,
      ),
      home:  HomePage(),
    );

  }
}


