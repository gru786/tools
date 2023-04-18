import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  double elevation = 4;
  String? code;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TOOLS',
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
            Icon(
              Icons.handyman,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     // Colors.grey.shade700,
          //     // Colors.grey.shade800,
          //
          //     Colors.deepPurple,
          //     Colors.pinkAccent.shade400,
          //   ],
          // ),
          color: Colors.grey.shade800,
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/password_generator');
                      },
                      child: Container(
                        height: screenHeight * 0.2,
                        padding: EdgeInsets.only(right: 5, bottom: 5),
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.lock,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Password Generator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          //TODO: Calculator
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.calculate_outlined,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/bmi_calculator');
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                        height: screenHeight * 0.2,
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.scale,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'BMI Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/age_calculator');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.person_4,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Age Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/qr_code_generator');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.qr_code,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'QR Code Generator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                            context: context,
                            onCode: (code) {
                              setState(
                                () {
                                  this.code = code;
                                },
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.qr_code_scanner,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'QR Code Scanner',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
                children: [
                  // tip calculato
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/discount_calculator_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.discount,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Discount Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //discount calculator
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/tip_calculator_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.monetization_on_sharp,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Tip Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/stopwatch_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.timer,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Stopwatch',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/unit_converter_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.transform,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Unit Converter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
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
                children: [
                  // reminder
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reminder_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.numbers,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'Word Counter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //emi_calculator
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/emi_calculator_screen');
                        },
                        child: Card(
                          elevation: elevation,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.attach_money,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              Text(
                                'EMI Calculator',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
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
