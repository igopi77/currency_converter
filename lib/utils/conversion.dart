import 'package:flutter/material.dart';

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