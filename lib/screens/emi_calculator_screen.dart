import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  TextEditingController txttotalAmountController = TextEditingController();
  TextEditingController txtRateController = TextEditingController();
  TextEditingController txtTimeController = TextEditingController();

  calculateEmi() {
    if (txttotalAmountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Amount can\'t be empty.',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    } else if (txtRateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Interest can\' be empty',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    } else if (txtTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Time can\'t be empty.',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    } else {
      //emi = P x R x (1+R)^N / [(1+R)^N-1]
      var amount = double.parse(txttotalAmountController.text.toString());
      var rate = double.parse(txtRateController.text.toString());
      var time = double.parse(txtTimeController.text.toString());

      double monthlyInterest = rate / 1200;
      double timeInMonth = time * 12;
      double emi =
          (amount * monthlyInterest * pow((1 + monthlyInterest), timeInMonth)) /
              (pow((1 + monthlyInterest), timeInMonth) - 1);
      int temp = (emi * 100).toInt();

      setState(() {
        emi = temp / 100.0;
        totalValue = emi.toInt();
      });
    }
  }

  int totalValue = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: Text(
          'EMI Calculator',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: totalValue == 0 ? 4 : 2,
                    child: Text(
                      totalValue == 0 ? 'EMI : (details below)' : 'EMI :',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      totalValue == 0 ? '' : ' ₹$totalValue',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: txttotalAmountController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Enter total loan amount here',
                      labelText: 'Amount',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: txtRateController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Interest',
                      hintText: 'Enter rate of interest per annum',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: txtTimeController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter total time in years',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll<Size>(
                          Size(200, screenHeight * 0.04)),
                      elevation: MaterialStatePropertyAll<double>(3),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3)),
                    ),
                    onPressed: () {
                      calculateEmi();
                    },
                    child: Text(
                      'Calculate EMI',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
