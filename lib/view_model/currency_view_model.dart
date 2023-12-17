import 'package:currency_converter/data/remote/key.dart';
import 'package:currency_converter/main.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/models/currency_model.dart';
import 'package:http/http.dart' as http;

Future<Map> FetchCurrencies() async{
    var response = await http.get(('https://openexchangerates.org/api/currencies.json' + key) as Uri);
    final allCurrencies = currencyModelFromJson(response.body);
    return allCurrencies;
}


