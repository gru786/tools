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

                              Text('WEIGHT', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,

                              ),),

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
                      child: Card(
                        elevation:  5 ,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male_sharp,
                              size: 85,
                              color: Colors.white,
                            ),

                          ],
                        ),
                      ),
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
