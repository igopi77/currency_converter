import 'package:currency_converter/models/rates_model.dart';
import 'package:currency_converter/view_model/components/anyToAny.dart';
import 'package:currency_converter/view_model/components/usdToAny.dart';
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
    var h =MediaQuery.of(context).size.height;
    var w =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter application"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/res/image/imageForCurrencyConverter.jpeg'),
            fit: BoxFit.cover
          )
        ),

        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                return Center(
                 child: FutureBuilder<Map>(
                   future: allCurrencies,
                   builder: (context,currSnapshot){
                     if(currSnapshot.connectionState == ConnectionState.waiting){
                       return Center(child: CircularProgressIndicator());
                     }
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         UsdToAny(
                           currencies: currSnapshot.data!,
                           rates: snapshot.data!.rates,
                         ),
                         anyToAny(
                             currencies: currSnapshot.data!,
                             rates: snapshot.data!.rates,
                         ),
                       ],
                     );
                   }
                 )
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
