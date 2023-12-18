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





























String convertUsd(Map exchangeRates, String usd, String currency) {
    String output =
    ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
        .toString();
    return output;
}

String convertAny(Map exchangeRates, String amount, String currencyBase,
    String currencyFinal) {
    String output = (double.parse(amount) /
        exchangeRates[currencyBase] *
        exchangeRates[currencyFinal])
        .toStringAsFixed(2)
        .toString();

    return output;
}