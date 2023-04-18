import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Timer? timer;
  int hr = 0, min = 0, sec = 0;
  bool timerRunning = false;
  var initialVal = Duration.zero;

  void pauseTimer() {
    setState(() {
      if (timer!.isActive) {
        timer!.cancel();
        timerRunning = false;
      } else {
        timerRunning = false;
      }
    });
  }

  void startTimer() {
    setState(() {
      timerRunning = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        sec--;
        if (sec < 0) {
          if (hr == 0 && min == 0) {
            sec = 0;
            timer.cancel();
            timerRunning = false;
            return;
          }
          if (min < 0) {
            hr--;
            min = 59;
            sec = 59;
          } else {
            min--;
            sec = 59;
          }
        }
      });

      //print(sec);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 14,
        shadowColor: Colors.black,
        title: const Text(
          'Stopwatch',
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
              Card(
                color: Colors.grey.shade800,
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hr > 9 ? hr.toString() + ' ' : '0$hr ',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      min > 9 ? ' : ' + min.toString() + ' : ' : ': 0$min : ',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      sec > 9 ? sec.toString() : ' 0$sec',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //time picker
              Card(
                elevation: 4,
                color: Colors.grey.shade800,
                child: CupertinoTimerPicker(
                  initialTimerDuration: initialVal,
                  onTimerDurationChanged: (val) {
                    hr = val.inHours;
                    min = val.inMinutes % 60;
                    sec = val.inSeconds % 60;
                    //print(hr);
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //play pause btns
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll<double>(3),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3)),
                    ),
                    onPressed: () {
                      if (timer!.isActive) {
                        timer!.cancel();
                        setState(() {
                          timerRunning = false;
                          hr = 0;
                          min = 0;
                          sec = 0;
                        });
                      }
                    },
                    child: Icon(
                      Icons.stop,
                      color: Colors.redAccent,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll<double>(3),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3)),
                    ),
                    onPressed: () {
                      timerRunning ? pauseTimer() : startTimer();
                    },
                    child: timerRunning
                        ? Icon(
                            Icons.pause,
                            color: Colors.lightGreenAccent,
                          )
                        : Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.lightGreenAccent,
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
//   static const countdownDuration = Duration(minutes: 10);
//   Duration duration = Duration();
//   Timer? timer;
//
//   bool countDown = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     reset();
//   }
//
//   void reset() {
//     if (countDown) {
//       setState(() => duration = countdownDuration);
//     } else {
//       setState(() => duration = Duration());
//     }
//   }
//
//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
//   }
//
//   void addTime() {
//     final addSeconds = countDown ? -1 : 1;
//     setState(() {
//       final seconds = duration.inSeconds + addSeconds;
//       if (seconds < 0) {
//         timer?.cancel();
//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }
//
//   void stopTimer({bool resets = true}) {
//     if (resets) {
//       reset();
//     }
//     setState(() => timer?.cancel());
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.orange[50],
//         appBar: AppBar(
//           //automaticallyImplyLeading: false,
//           title: Text('Stopwatch'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildTime(),
//               SizedBox(
//                 height: 80,
//               ),
//               buildButtons()
//             ],
//           ),
//         ),
//       );
//
//   Widget buildTime() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       buildTimeCard(time: hours, header: 'HOURS'),
//       SizedBox(
//         width: 8,
//       ),
//       buildTimeCard(time: minutes, header: 'MINUTES'),
//       SizedBox(
//         width: 8,
//       ),
//       buildTimeCard(time: seconds, header: 'SECONDS'),
//     ]);
//   }
//
//   Widget buildTimeCard({required String time, required String header}) =>
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Text(
//               time,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 50),
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           Text(header, style: TextStyle(color: Colors.black45)),
//         ],
//       );
//
//   Widget buildButtons() {
//     final isRunning = timer == null ? false : timer!.isActive;
//     final isCompleted = duration.inSeconds == 0;
//     return isRunning || isCompleted
//         ? Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   child: Text(
//                     'STOP',
//                   ),
//                   onPressed: () {
//                     if (isRunning) {
//                       stopTimer(resets: false);
//                     }
//                   }),
//               SizedBox(
//                 width: 12,
//               ),
//               ElevatedButton(child: Text("CANCEL"), onPressed: stopTimer),
//             ],
//           )
//         : ElevatedButton(
//             child: Text("Start Timer!"),
//             onPressed: () {
//               startTimer();
//             });
//   }
// }
