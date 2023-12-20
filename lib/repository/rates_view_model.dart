import 'package:currency_converter/data/remote/key.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/models/rates_model.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> fetchRates() async {
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id='+key));
  final result = ratesModelFromJson(response.body);
  return result;
}
