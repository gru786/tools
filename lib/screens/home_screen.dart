import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Tools',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
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
                      onTap: (){
                        Navigator.pushNamed(
                            context, '/password_generator');
                      },
                      child: Container(
                        height: screenHeight * 0.2,
                        padding: EdgeInsets.only(right: 5, bottom: 5),

                        child: Card(

                          elevation: 4,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color:Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.calculate_outlined,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/bmi_calculator');
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                        height: screenHeight * 0.2,

                        child: Card(
                          elevation: 5,
                          color: Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                      padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.person_4,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.qr_code,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.qr_code_scanner,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color:Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.timer,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              'Stop Watch',
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.transform,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color:Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.alarm_add,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              'Reminder',
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                      height: screenHeight * 0.2,

                      child: Card(
                        elevation: 5,
                        color: Colors.grey.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.attach_money,
                                size: 60,
                                color: Colors.lightGreenAccent,
                              ),
                              onPressed: () {},
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
