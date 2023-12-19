import 'package:flutter/material.dart';

class anyToAny extends StatefulWidget {
  const anyToAny({super.key});

  @override
  State<anyToAny> createState() => _anyToAnyState();
}

class _anyToAnyState extends State<anyToAny> {
  TextEditingController amountController = TextEditingController();
  var dropDownValue1 = "ASD";
  var dropDownValue2 = "ASD";
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

          ],
        ),
      ),
    );
  }
}
