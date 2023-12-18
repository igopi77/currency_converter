import 'package:currency_converter/models/rates_model.dart';
import 'package:currency_converter/view_model/currency_view_model.dart';
import 'package:currency_converter/view_model/rates_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RatesModel> result;
  late Future<Map> allCurrencies;
  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    setState(() {
      result = FetchRates();
      allCurrencies =FetchCurrencies();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Text("Gopinath"),
    );
  }
}
