import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorScreen extends StatefulWidget {
  const QRCodeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeGeneratorScreen> createState() => _QRCodeGeneratorScreenState();
}

class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  TextEditingController txtQrTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: Text(
          'QR Code Generator',
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
                height: screenHeight * 0.45,
                child: Card(
                  color: Colors.grey.shade800,
                  elevation: 4,
                  child: ListTile(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    title: Text(
                      'Enter your text here:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: TextField(
                      controller: txtQrTextEditingController,
                      maxLines: 10,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
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
                      showDialog(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Generated QR',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              height: 300,
                              width: 300,
                              child: Center(
                                child: QrImage(
                                  data: txtQrTextEditingController.text,
                                  //size: 280,
                                  foregroundColor: Colors.lightGreenAccent,

                                  // You can include embeddedImageStyle Property if you
                                  //wanna embed an image from your Asset folder
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Okay'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Generate QR'),
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
