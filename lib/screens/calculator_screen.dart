import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController txtCalcTextEditingController = TextEditingController();
  String input = '';
  bool negativeNumber = false;

  var list = [];
  bool divisionPressed = false;
  bool multiplyPressed = false;
  bool subPressed = false;
  bool addPressed = false;
  bool buttonPressed = false;
  bool decimalEnabled = true;
  var sizeOfButtons = const Size(80, 60);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: Text(
          'Calculator',
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
              SizedBox(
                  height: screenHeight * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        controller: txtCalcTextEditingController,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        enabled: false,
                        style: const TextStyle(
                          letterSpacing: 2,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),),
              SizedBox(
                height: screenHeight * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //1st Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  Cancel
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: MaterialStatePropertyAll<double>(4),
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.grey.shade700),
                              padding: MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              input = '';
                              txtCalcTextEditingController.text = input;
                              list = [];
                              addPressed = false;
                              subPressed = false;
                              multiplyPressed = false;
                              divisionPressed = false;
                              negativeNumber = false;
                            });
                          },
                          child: Text(
                            input == '' ? 'AC' : 'C',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        // +/-
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:  MaterialStatePropertyAll<Size>(
                                sizeOfButtons,
                            ),
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.grey.shade700),
                            elevation:
                                const MaterialStatePropertyAll<double>(4),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            print(negativeNumber);
                            print(list);
                            setState(() {
                              var temp = double.parse(input);
                              if (temp < 0) {
                                negativeNumber = true;
                              }
                              if (negativeNumber == false) {
                                input = "-" + input;
                                negativeNumber = true;
                              } else {
                                var temp = input.split('-');
                                input = temp[1];
                                negativeNumber = false;
                                //print(temp);
                              }
                              txtCalcTextEditingController.text = input;
                            });
                          },
                          child: Text(
                            '+/-',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //  percentage
                        ElevatedButton(
                          style: ButtonStyle(
                            enableFeedback: true,
                            fixedSize:  MaterialStatePropertyAll<Size>(
                                sizeOfButtons),
                            elevation:
                                const MaterialStatePropertyAll<double>(4),
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.grey.shade700),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            var first = double.parse(input);
                            input = "";
                            list.add(first);
                            list.add('%');
                            print(list);
                          },
                          child: const Text(
                            '%',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //  divide
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              backgroundColor: divisionPressed
                                  ? MaterialStatePropertyAll<Color>(
                                      Colors.grey.shade800)
                                  : const MaterialStatePropertyAll<Color>(
                                      Colors.lightGreenAccent),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              multiplyPressed = false;
                              divisionPressed = true;
                              decimalEnabled = true;
                              subPressed = false;
                              addPressed = false;

                              print(list);
                              if (buttonPressed &&
                                  (list.last == '+' ||
                                      list.last == '-' ||
                                      list.last == '*')) {
                                // print(list);
                                // print(buttonPressed);
                                print('if');
                                list.removeLast();
                                list.add('/');
                              } else if (list.length == 2) {
                                var symbol = list.last;
                                list.removeLast();
                                var first = list.last;
                                list.removeLast();
                                if (symbol == '/') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first / second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('/');
                                } else if (symbol == '*') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('/');
                                } else if (symbol == '-') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first - second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('/');
                                } else if (symbol == '+') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first + second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('/');
                                }
                                else if (symbol == '%') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first/100 * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('/');
                                }
                              } else if (list.length == 1) {
                                list.removeLast();
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('/');
                              } else {
                                if (input.length == 0) {
                                  divisionPressed = false;
                                  return;
                                } else {
                                  double first = double.parse(input);
                                  input = "";
                                  list.add(first);
                                  list.add('/');
                                }
                              }

                              buttonPressed = true;
                            });
                            //print(list);
                          },
                          child: Text(
                            '/',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // 2nd row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //7
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: MaterialStatePropertyAll<double>(4),
                              padding: MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "7";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "7";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: Text(
                            '7',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //8
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation:const MaterialStatePropertyAll<double>(4),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "8";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "8";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: Text(
                            '8',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //9
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "9";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "9";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: Text(
                            '9',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //*
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              backgroundColor: multiplyPressed
                                  ? MaterialStatePropertyAll<Color>(
                                      Colors.grey.shade800)
                                  : const MaterialStatePropertyAll<Color>(
                                      Colors.lightGreenAccent),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              multiplyPressed = true;
                              divisionPressed = false;
                              subPressed = false;
                              addPressed = false;
                              decimalEnabled = true;

                              if (buttonPressed &&
                                  (list.last == '+' ||
                                      list.last == '-' ||
                                      list.last == '/')) {
                                list.removeLast();
                                list.add('*');
                              } else if (list.length == 2) {
                                var symbol = list.last;
                                list.removeLast();
                                var first = list.last;
                                list.removeLast();
                                if (symbol == '/') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first / second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('*');
                                }
                                else if (symbol == '%') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first/100 * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('*');
                                }
                                else if (symbol == '*') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('*');
                                } else if (symbol == '-') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first - second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('*');
                                } else if (symbol == '+') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first + second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('*');
                                }
                              } else if (list.length == 1) {
                                list.removeLast();
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('*');
                              } else {
                                if (input.length == 0) {
                                  multiplyPressed = false;
                                  return;
                                } else {
                                  double first = double.parse(input);
                                  input = "";
                                  list.add(first);
                                  list.add('*');
                                }
                              }
                              buttonPressed = true;
                            });
                          },
                          child: const Text(
                            '*',
                            style:  TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //3rd Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //4
                        ElevatedButton(
                          style:  ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll<Size>(sizeOfButtons),
                            elevation: const MaterialStatePropertyAll<double>(4),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "4";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "4";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: Text(
                            '4',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //5
                        ElevatedButton(
                          style:  ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll<Size>(sizeOfButtons),
                            elevation: const MaterialStatePropertyAll<double>(4),
                            padding:const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "5";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "5";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: const Text(
                            '5',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //6
                        ElevatedButton(
                          style:  ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll<Size>(sizeOfButtons),
                            elevation: const MaterialStatePropertyAll<double>(4),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            if (buttonPressed) {
                              input = "6";
                              buttonPressed = false;
                              txtCalcTextEditingController.text = input;
                            } else {
                              input += "6";
                              txtCalcTextEditingController.text = input;
                            }
                          },
                          child: const Text(
                            '6',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //-
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll<Size>(sizeOfButtons),
                            elevation: const MaterialStatePropertyAll<double>(4),
                            backgroundColor: subPressed
                                ? MaterialStatePropertyAll<Color>(
                                    Colors.grey.shade800)
                                : const MaterialStatePropertyAll<Color>(
                                    Colors.lightGreenAccent),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          onPressed: () {
                            print(list);
                            setState(() {
                              multiplyPressed = false;
                              divisionPressed = false;
                              subPressed = true;
                              decimalEnabled = true;
                              addPressed = false;

                              if (buttonPressed &&
                                  (list.last == '+' ||
                                      list.last == '/' ||
                                      list.last == '*')) {
                                list.removeLast();
                                list.add('-');
                              } else if (list.length == 2) {
                                var symbol = list.last;
                                list.removeLast();
                                var first = list.last;
                                list.removeLast();
                                if (symbol == '/') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first / second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('-');
                                }
                                else if (symbol == '%') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first/100 * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('-');
                                }
                                else if (symbol == '*') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('-');
                                } else if (symbol == '-') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first - second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('-');
                                } else if (symbol == '+') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first + second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('-');
                                }
                              } else if (list.length == 1) {
                                list.removeLast();
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('-');
                              } else {
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('-');
                              }
                              buttonPressed = true;
                            });
                          },
                          child: const Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //4th row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //1
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation:const MaterialStatePropertyAll<double>(4),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "1";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "1";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child:const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //2
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation:const MaterialStatePropertyAll<double>(4),
                              padding:const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "2";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "2";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: const Text(
                            '2',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //3
                        ElevatedButton(
                          style: const ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(Size(80, 60)),
                              elevation: MaterialStatePropertyAll<double>(4),
                              padding: MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "3";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "3";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //+
                        ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              backgroundColor: addPressed
                                  ? MaterialStatePropertyAll<Color>(
                                      Colors.grey.shade800)
                                  : const MaterialStatePropertyAll<Color>(
                                      Colors.lightGreenAccent),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              multiplyPressed = false;
                              divisionPressed = false;
                              decimalEnabled = true;
                              subPressed = false;
                              addPressed = true;

                              if (buttonPressed &&
                                  (list.last == '/' ||
                                      list.last == '-' ||
                                      list.last == '*')) {
                                list.removeLast();
                                list.add('+');
                              } else if (list.length == 2) {
                                var symbol = list.last;
                                list.removeLast();
                                var first = list.last;
                                list.removeLast();
                                if (symbol == '/') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first / second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('+');
                                } else if (symbol == '*') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('+');
                                }
                                else if (symbol == '%') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first/100 * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('+');
                                }
                                else if (symbol == '-') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first - second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('+');
                                } else if (symbol == '+') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first + second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                  list.add('+');
                                }
                              } else if (list.length == 1) {
                                list.removeLast();
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('+');
                              } else {
                                double first = double.parse(input);
                                input = "";
                                list.add(first);
                                list.add('+');
                              }
                              buttonPressed = true;
                            });
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //5th row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //0
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(Size(sizeOfButtons.width * 2 + 6, sizeOfButtons.height)),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              if (buttonPressed) {
                                input = "0";
                                buttonPressed = false;
                                txtCalcTextEditingController.text = input;
                              } else {
                                input += "0";
                                txtCalcTextEditingController.text = input;
                              }
                            });
                          },
                          child: const Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //.
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            if (decimalEnabled) {
                              setState(() {
                                input += '.';
                                txtCalcTextEditingController.text = input;
                                decimalEnabled = false;
                              });
                            }
                          },
                          child: const Text(
                            '.',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),

                        //=
                        ElevatedButton(
                          style:  ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll<Size>(sizeOfButtons),
                              elevation: const MaterialStatePropertyAll<double>(4),
                              backgroundColor: const MaterialStatePropertyAll<Color>(
                                  Colors.lightGreenAccent),
                              padding: const MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10))),
                          onPressed: () {
                            setState(() {
                              multiplyPressed = false;
                              divisionPressed = false;
                              subPressed = false;
                              addPressed = false;
                              buttonPressed = true;
                              decimalEnabled = true;
                              if (list.length == 2) {
                                var symbol = list.last;
                                list.removeLast();
                                var first = list.last;
                                list.removeLast();
                                if (symbol == '/') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first / second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                }
                                else if (symbol == '%') {
                                  var second = double.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first/100 * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);

                                }

                                else if (symbol == '*') {
                                  var second = int.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first * second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                } else if (symbol == '-') {
                                  var second = int.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first - second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                } else if (symbol == '+') {
                                  var second = int.parse(input);
                                  print(first);
                                  print(second);
                                  var result = first + second;
                                  print(result);
                                  input = result.toString();
                                  txtCalcTextEditingController.text = input;
                                  list.add(result);
                                }
                              } else {
                                int first = int.parse(input);
                                input = "";
                                list.add(first);
                              }
                              print(list);
                            });
                          },
                          child: const Text(
                            '=',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
