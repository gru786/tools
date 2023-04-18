import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<PasswordGeneratorScreen> createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  var lowCaseToChoose = "abcdefghijklmnopqrstuvxyz";
  var upCaseToChoose = "ABCDEFGHIJKLMNOPQRSTUVXYZ";
  var numbersToChoose = "0123456789";
  var specialCharToChoose = "!@#\$%^&*()_-~";
  bool upperCase = true;
  bool lowerCase = false;
  bool numbers = false;
  bool symbols = false;

  double sliderValue = 1 / 30;
  String generatedPassword = '';
  TextEditingController txtPasswordGenerated = TextEditingController();

  generatePassword() {
    generatedPassword = '';
    int sliderVal = (sliderValue * 30).toInt();
    print(sliderVal);
    int rand = 0;
    print(sliderVal);
    while (sliderVal > 0) {
      if (!symbols && !numbers && !lowerCase && !upperCase) {
        break;
      }

      if (upperCase) {
        rand = Random().nextInt(upCaseToChoose.length);
        //print(rand);
        generatedPassword += upCaseToChoose[rand].toString();
        sliderVal--;
        if (sliderVal <= 0) {
          break;
        }
      }
      if (lowerCase) {
        rand = Random().nextInt(lowCaseToChoose.length);
        generatedPassword += lowCaseToChoose[rand].toString();
        sliderVal--;
        if (sliderVal <= 0) {
          break;
        }
      }
      if (numbers) {
        rand = Random().nextInt(numbersToChoose.length);
        generatedPassword += numbersToChoose[rand].toString();
        sliderVal--;
        if (sliderVal <= 0) {
          break;
        }
      }
      if (symbols) {
        rand = Random().nextInt(specialCharToChoose.length);
        generatedPassword += specialCharToChoose[rand].toString();
        sliderVal--;
        if (sliderVal <= 0) {
          break;
        }
      }
    }

    print(generatedPassword);
    txtPasswordGenerated.text = generatedPassword;
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
          'Password Generator',
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
              //uppercase
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        upperCase = !upperCase;
                      });
                    },
                    title: Text('Include UPPERCASE'),
                    trailing: upperCase
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(Icons.circle_outlined),
                  ),
                ),
              ),

              //lowercase
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        lowerCase = !lowerCase;
                      });
                    },
                    title: Text('Include lowercase'),
                    trailing: lowerCase
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(Icons.circle_outlined),
                  ),
                ),
              ),

              //numbers
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        numbers = !numbers;
                      });
                    },
                    title: Text('Include Numbers'),
                    trailing: numbers
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(Icons.circle_outlined),
                  ),
                ),
              ),

              //symbols
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    onTap: () {
                      setState(() {
                        symbols = !symbols;
                      });
                    },
                    title: Text('Include Symbols'),
                    trailing: symbols
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(Icons.circle_outlined),
                  ),
                ),
              ),

              const Text('Password Length'),

              //slider
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Slider.adaptive(
                      value: sliderValue,
                      onChanged: (val) {
                        setState(() {
                          sliderValue = val;
                        });
                      },
                      label: (sliderValue * 30).toString(),
                      divisions: 30,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      (sliderValue * 30).toInt().toString(),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll<double>(10),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.grey.shade800,
                      ),
                    ),
                    onPressed: () {
                      generatePassword();
                    },
                    child: Text('Generate Password'),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              TextField(
                controller: txtPasswordGenerated,
                maxLines: 3,
                decoration: InputDecoration(
                    icon: IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                                text: txtPasswordGenerated.text.toString()))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              elevation: 5,
                              backgroundColor: Color(0xff000000),
                              content: Text(
                                'Password copied to your clipboard!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
