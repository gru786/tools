import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiscountCalculatorScreen extends StatefulWidget {
  const DiscountCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<DiscountCalculatorScreen> createState() =>
      _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState extends State<DiscountCalculatorScreen> {
  TextEditingController txtDiscountController = TextEditingController();
  double percent = 0;
  double tipAmount = 0;
  double totalValue = 0;

  calculateTip() {
    String input = txtDiscountController.text.toString();
    print(input);
    totalValue = double.parse(input);
    setState(() {
      tipAmount = totalValue * percent;
      int temp = (tipAmount * 100).toInt();
      tipAmount = temp / 100;
      totalValue = totalValue - tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: Text(
          'Discount Calculator',
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
              Card(
                elevation: 4,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: txtDiscountController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Enter total amount here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.05;
                        calculateTip();
                      },
                      child: Text('5%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.1;
                        calculateTip();
                      },
                      child: Text('10%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.15;
                        calculateTip();
                      },
                      child: Text('15%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.2;
                        calculateTip();
                      },
                      child: Text('20%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.25;
                        calculateTip();
                      },
                      child: Text('25%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.3;
                        calculateTip();
                      },
                      child: Text('30%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.35;
                        calculateTip();
                      },
                      child: Text('35%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.4;
                        calculateTip();
                      },
                      child: Text('40%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.5;
                        calculateTip();
                      },
                      child: Text('50%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStatePropertyAll<double>(10),
                      ),
                      onPressed: () {
                        percent = 0.6;
                        calculateTip();
                      },
                      child: Text('60%'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text(
                      'Discounted amount :',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreenAccent),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ' ₹$totalValue',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
