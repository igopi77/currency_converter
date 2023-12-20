
import 'package:flutter/material.dart';
import 'package:currency_converter/utils/conversion.dart';

class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const UsdToAny({super.key, @required this.rates, required this.currencies});

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropDownValue ='INR';
  String answer = "converted value will be shown here :)";

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "USD to Any Currency",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            TextFormField(
              key: ValueKey('key'),
              controller: usdController,
              decoration: InputDecoration(hintText: "Enter a USD"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: DropdownButton<String> (
                    value: dropDownValue,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade200,
                    ),
                    onChanged: (String ? newValue){
                      setState(() {
                        dropDownValue=newValue!;
                      });
                    },
                    items: widget.currencies.keys
                      .toSet()
                      .toList()
                      .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                    }).toList(),
                ),
                ),
                SizedBox(
                  width: 10,
                ),

                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        answer = dropDownValue + ' USD = ' + convertUsd(
                            widget.rates,usdController.text,dropDownValue
                        ) + ' ' + dropDownValue;

                      });
                    },
                    child: Text("Convert"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,),
            Container(child: Text(answer),)
          ],
        ),
      ),
    );
  }
}
