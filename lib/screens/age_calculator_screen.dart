import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  var date = new DateTime.now().toString().split(' ')[0];
  var birthday = new DateTime.now().toString().split(' ')[0];
  bool checkedOnce = false;
  int yearAge = 0, monthAge = 0, dayAge = 0;

  checkAge(String date, String birthday) {
    var dates = date.split('-');
    var birthdates = birthday.split('-');
    //print(birthdates);
    yearAge = int.parse(dates[0]) - int.parse(birthdates[0]);
    monthAge = int.parse(dates[1]) - int.parse(birthdates[1]);
    if (monthAge < 0) {
      yearAge--;
      monthAge = 12 - monthAge * -1;
    }
    dayAge = int.parse(dates[2]) - int.parse(birthdates[2]);
    if (dayAge < 0) {
      monthAge--;
      dayAge = 30 - dayAge * -1;
    }

    //print(yearAge);
    if (monthAge == 0 && dayAge == 0 && yearAge > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Yayyy.. We wish you a very happy birthday!🥳',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    }
    if (yearAge > 99) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Hats off to you Sir, for making it sooooooo long. 🫡',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    }
    if (yearAge < 0) {
      setState(() {
        birthdates = new DateTime.now().toString().split(' ');
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Oh noo.. you are ahead of time. You are yet to take birth. Please come back later!🫣',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
      yearAge = 0;
      monthAge = 0;
    }
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
          'Age Calculator',
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
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    title: Text(
                      'Today\'s date:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      date.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.45,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                      enableFeedback: true,
                      splashColor: Colors.black,
                      title: Text(
                        'Your birthday:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (datetime) {
                          birthday = datetime.toString().split(' ')[0];
                        },
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                height: screenHeight * 0.1,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    title: Text(
                      'Your age:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Years : $yearAge | Months : $monthAge | Days : $dayAge',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
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
                      checkAge(date, birthday);
                      setState(() {
                        checkedOnce = true;
                      });
                    },
                    child: checkedOnce ? Text('Check Again') : Text('Check'),
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
