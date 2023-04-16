import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TextEditingController txtWordCounterText = TextEditingController();

  countWords() {
    if (txtWordCounterText.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'There are total 0 words.',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    } else {
      var wordsList =
          txtWordCounterText.text.toString().trimLeft().trimRight().split(' ');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'There are total ${wordsList.length} words.',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
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
          'Words Counter',
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
              TextField(
                controller: txtWordCounterText,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Put your text here',
                    labelText: 'Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              const SizedBox(
                height: 20,
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
                      countWords();
                    },
                    child: Text(' Count words'),
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
