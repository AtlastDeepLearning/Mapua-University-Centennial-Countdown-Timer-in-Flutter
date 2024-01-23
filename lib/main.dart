import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Frame3(),
      ),
      title: 'Debug Banner',
      debugShowCheckedModeBanner: false,
    );
  }
}

class Frame3 extends StatefulWidget {
  const Frame3({super.key});

  @override
  _Frame3State createState() => _Frame3State();
}

class _Frame3State extends State<Frame3> {
  late int days;
  late int hours;
  late int minutes;
  late int seconds;

  @override
  void initState() {
    super.initState();
    updateCountdown();
  }

  void updateCountdown() {
    DateTime endDate = DateTime(2025, 1, 20, 19, 48, 0);

    // Calculate the time difference
    Duration timeDifference = endDate.difference(DateTime.now());

    // Convert the time difference to seconds and round to the nearest integer
    int myTime = timeDifference.inSeconds;

    // Calculate days, hours, minutes, and seconds
    seconds = myTime % 60;
    minutes = (myTime ~/ 60) % 60;
    hours = (myTime ~/ 3600) % 24;
    days = myTime ~/ 86400;

    // Update the countdown every second
    Timer(const Duration(seconds: 1), updateCountdown);

    setState(() {}); // Trigger a rebuild to update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1920,
          height: 1080,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1920,
                  height: 1080,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Frame.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              // Your other Positioned widgets...

              // Days left
              Positioned(
                left: 633,
                top: 207,
                child: Text(
                  '$days',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFD9291C),
                    fontSize: 386,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(95, 88, 88, 100),
                        blurRadius: 1,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),

              // Hours
              Positioned(
                left: 537,
                top: 711,
                child: Text(
                  hours.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFB81D),
                    fontSize: 196,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(95, 88, 88, 100),
                        blurRadius: 1,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),

              // Minutes
              Positioned(
                left: 850,
                top: 711,
                child: Text(
                  minutes.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFB81D),
                    fontSize: 196,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(95, 88, 88, 100),
                        blurRadius: 1,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),

              // Seconds
              Positioned(
                left: 1147,
                top: 711,
                child: Text(
                  seconds.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFB81D),
                    fontSize: 196,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(95, 88, 88, 100),
                        blurRadius: 1,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
