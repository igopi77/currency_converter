import 'package:flutter/material.dart';
import 'package:currency_converter/utils/conversion.dart';

class anyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const anyToAny({super.key, this.rates, required this.currencies});

  @override
  State<anyToAny> createState() => _anyToAnyState();
}

class _anyToAnyState extends State<anyToAny> {
  TextEditingController amountController = TextEditingController();
  var dropDownValue1 = "INR";
  var dropDownValue2 = "USD";
  var answer = "Result will be shown here :)";
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return  Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Convert Any Currency",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            TextFormField(
              key: ValueKey('key'),
              controller: amountController,
              decoration: InputDecoration(hintText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropDownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade200,
                    ),
                    onChanged: (String ? newValue1){
                      setState(() {
                        dropDownValue1 = newValue1!;
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('to'),),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropDownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade200,
                    ),
                    onChanged: (String ? newValue2){
                      setState(() {
                        dropDownValue2 = newValue2!;
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

              ],
            ),
            SizedBox(width: 20),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer = amountController.text +' ' + dropDownValue1 + ' '+ convertAny(widget.rates, amountController.text, dropDownValue1, dropDownValue2) + ' ' + dropDownValue2;
                  });
                },
                child: Text("Convert"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),

              ),
            ),
            SizedBox(width: 10,),
            SizedBox(height: 10,),
            Container(child: Text(answer),)
          ],
        ),
      ),
    );
  }
}
