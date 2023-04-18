import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({Key? key}) : super(key: key);

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  TextEditingController txtFromTextEditingController = TextEditingController();
  TextEditingController txtToTextEditingController = TextEditingController();

  List measures = [
    'Length',
    'Area',
    'Temperature',
    'Volume',
    'Mass',
    'Speed',
    'Time',
  ];
  static const double feetMultiplier = 3.28084;
  static const double sqFeetMultiplier = 10.764;
  static const double kgMultiplier = 2.20462;
  static const double meterPerSecondMultiplier = 3.6;

  bool fromChanged = false;

  var units = [
    ['Metre', 'Feet'],
    ['Squared metre', 'Squared feet'],
    ['Celcius', 'Farenhiet'],
    ['Cubic cm', 'Cubic m'],
    ['kg', 'Pound'],
    ['km/h', 'm/s'],
    ['Minute', 'Second'],
  ];

  void convert() {
    if (txtFromTextEditingController.text.isEmpty &&
        txtToTextEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 5,
          backgroundColor: Color(0xff000000),
          content: Text(
            'Please enter value in either of the field, to convert it.',
            style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
          ),
        ),
      );
    } else if ((txtFromTextEditingController.text.isNotEmpty &&
            txtToTextEditingController.text.isEmpty) ||
        fromChanged) {
      //1 meter = 3.28084 feet
      if (chipValue == 0) {
        double meters =
            double.parse(txtFromTextEditingController.text.toString());

        double feet = meters * feetMultiplier;
        txtToTextEditingController.text = feet.toString();
      }
      if (chipValue == 1) {
        double sqMeter =
            double.parse(txtFromTextEditingController.text.toString());

        double sqFeet = sqMeter * sqFeetMultiplier;
        txtToTextEditingController.text = sqFeet.toString();
      }
      if (chipValue == 2) {
        double celcius =
            double.parse(txtFromTextEditingController.text.toString());

        double farenhiet = (celcius * 9 / 5) + 32;
        txtToTextEditingController.text = farenhiet.toString();
      }

      if (chipValue == 3) {
        double cmCube =
            double.parse(txtFromTextEditingController.text.toString());

        double mCube = cmCube / 1000000;
        txtToTextEditingController.text = mCube.toString();
      }
      if (chipValue == 4) {
        double kg = double.parse(txtFromTextEditingController.text.toString());

        double pound = kg * kgMultiplier;
        txtToTextEditingController.text = pound.toString();
      }
      if (chipValue == 5) {
        double kmph =
            double.parse(txtFromTextEditingController.text.toString());

        double ms = kmph / meterPerSecondMultiplier;
        txtToTextEditingController.text = ms.toString();
      }

      if (chipValue == 6) {
        double hour =
            double.parse(txtFromTextEditingController.text.toString());

        double second = hour * 60;
        txtToTextEditingController.text = second.toString();
      }
    } else {
      if (chipValue == 0) {
        double feet = double.parse(txtToTextEditingController.text.toString());

        double meters = feet / feetMultiplier;
        txtFromTextEditingController.text = meters.toString();
      }
      if (chipValue == 1) {
        double sqFeet =
            double.parse(txtToTextEditingController.text.toString());

        double sqMeters = sqFeet / sqFeetMultiplier;
        txtFromTextEditingController.text = sqMeters.toString();
      }
      if (chipValue == 2) {
        double farenhiet =
            double.parse(txtToTextEditingController.text.toString());

        double celcius = (farenhiet - 32) * 5 / 9;
        txtFromTextEditingController.text = celcius.toString();
      }
      if (chipValue == 3) {
        double mCube = double.parse(txtToTextEditingController.text.toString());

        double cmCube = mCube * 1000000;
        txtFromTextEditingController.text = cmCube.toString();
      }
      if (chipValue == 4) {
        double pound = double.parse(txtToTextEditingController.text.toString());

        double kg = pound / kgMultiplier;
        txtFromTextEditingController.text = kg.toString();
      }
      if (chipValue == 5) {
        double kmph = double.parse(txtToTextEditingController.text.toString());

        double ms = kmph * meterPerSecondMultiplier;
        txtFromTextEditingController.text = ms.toString();
      }
      if (chipValue == 6) {
        double second =
            double.parse(txtToTextEditingController.text.toString());

        double minute = second / 60;
        txtFromTextEditingController.text = minute.toString();
      }
    }
  }

  int chipValue = 0;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: Text(
          'Unit Converter',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => Container(
                      padding: EdgeInsets.all(2),
                      child: ChoiceChip(
                          onSelected: ((bool selected) {
                            setState(() {
                              if (selected) {
                                chipValue = index;
                                txtToTextEditingController.clear();
                                txtFromTextEditingController.clear();
                              }
                            });
                          }),
                          label: Text('${measures[index]}'),
                          selected: chipValue == index),
                    ),
                  ).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 4,
                child: TextField(
                  onChanged: (String s) {
                    fromChanged = true;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: txtFromTextEditingController,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    hintStyle: TextStyle(fontSize: 16),
                    hintText:
                        'Enter ${measures[chipValue]} in ${units[chipValue][0]}',
                    labelText: '${units[chipValue][0]}',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 4,
                child: TextField(
                  onChanged: (String s) {
                    fromChanged = false;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: txtToTextEditingController,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    hintStyle: TextStyle(fontSize: 16),
                    hintText:
                        'Enter ${measures[chipValue]} in ${units[chipValue][1]}',
                    labelText: '${units[chipValue][1]}',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
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
                      convert();
                    },
                    child: Text(
                      'Convert',
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
