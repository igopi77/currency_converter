import 'package:currency_converter/data/remote/key.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/models/rates_model.dart';
import 'package:http/http.dart' as http;

Future<RatesModel> FetchRates() async {
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=YOUR_APP_IDhttps://openexchangerates.org/api/latest.json?app_id=d0bbbf227af4458f8a9ca1eb55c4ec1d'+key));
  final result = ratesModelFromJson(response.body);
  return result;
}
