import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  bool femaleSelected = true;
  double sliderValue = 0;
  double weight = 50;
  double age = 20;

  Future<void> _showMyDialog() async {
    double height = (sliderValue *100 + 100)/100;
    print(weight);
    print(height);
    double bmi = weight / (height * height);
    print(bmi);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your BMI result!', style: TextStyle(fontSize: 18),),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(bmi.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          'BMI Calculator',
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
              //gender select
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleSelected = !femaleSelected;
                          });
                        },
                        child: Card(
                          elevation: femaleSelected ? 10 : 5,
                          color: femaleSelected
                              ? Colors.grey.shade900
                              : Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female_sharp,
                                size: 85,
                                color: Colors.white,
                              ),
                              Text('Female'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleSelected = !femaleSelected;
                          });
                        },
                        child: Card(
                          elevation: femaleSelected ? 5 : 10,
                          color: femaleSelected
                              ? Colors.grey.shade800
                              : Colors.grey.shade900,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male_sharp,
                                size: 85,
                                color: Colors.white,
                              ),
                              Text('Male'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //height
              Container(
                height: screenHeight * 0.25,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.grey.shade800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Slider.adaptive(
                          value: sliderValue,
                          divisions: 100,
                          label: (sliderValue * 100 + 100).toString() + ' cm',
                          onChanged: (val) {
                            setState(() {
                              sliderValue = val;
                            });
                          }),
                      Text(
                        (sliderValue * 100 + 100).toString() + ' cm',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //weight
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleSelected = !femaleSelected;
                          });
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                weight.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll<double>(2),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight = weight - 1.0;
                                      });
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll<double>(2),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight = weight + 1.0;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //age
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleSelected = !femaleSelected;
                          });
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                age.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll<double>(2),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age = age - 1.0;
                                      });
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll<double>(2),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age = age + 1.0;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll<Size>(Size(200, screenHeight * 0.04)),
                      elevation: MaterialStatePropertyAll<double>(3),
                      padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20, vertical: 3)),
                    ),
                    onPressed: () {
                      _showMyDialog();

                    },
                    child: Text('Calculate BMI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
