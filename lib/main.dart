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

  List<double> getFontSizes(double screenSize) {
    double daysFontSize = 0;
    double hoursMinuteSecondsSize = 0;

    if (screenSize == 2540) {
      daysFontSize = 484;
      hoursMinuteSecondsSize = 256;
    } else {
      daysFontSize = 386;
      hoursMinuteSecondsSize = 197;
    }

    return [daysFontSize, hoursMinuteSecondsSize];
  }

  List<double> getBgSize(double screenSize) {
    double width = 0;
    double length = 0;

    if (screenSize == 2540) {
      width = 2540;
      length = 1440;
    } else {
      width = 1920;
      length = 1080;
    }

    return [width, length];
  }

  EdgeInsets getEdgeInsets(double screenSize, String type) {
    if (screenSize == 2540) {
      switch (type) {
        case 'days':
          return const EdgeInsets.only(left: 846, top: 201);
        case 'hours':
          return const EdgeInsets.only(left: 400, top: 815);
        case 'minutes':
          return const EdgeInsets.only(left: 1070, top: 815);
        case 'seconds':
          return const EdgeInsets.only(left: 1609, top: 815);
      }
    } else {
      switch (type) {
        case 'days':
          return const EdgeInsets.only(left: 633, top: 154);
        case 'hours':
          return const EdgeInsets.only(left: 431, top: 621);
        case 'minutes':
          return const EdgeInsets.only(left: 850, top: 621);
        case 'seconds':
          return const EdgeInsets.only(left: 1247, top: 621);
      }
    }

    // Default value if none of the conditions are met
    return EdgeInsets.zero;
  }

  @override
  void initState() {
    super.initState();
    updateCountdown();
  }

  void updateCountdown() {
    DateTime endDate = DateTime(2025, 1, 25, 0, 0, 0);

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
    double screenSize = MediaQuery.of(context).size.width;

    List<double> fontSizes = getFontSizes(screenSize);
    List<double> bgSize = getBgSize(screenSize);

    return Column(
      children: [
        Container(
          width: bgSize[0],
          height: bgSize[1],
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
                  width: bgSize[0],
                  height: bgSize[1],
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Frame.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              // Days left
              Positioned(
                left: getEdgeInsets(screenSize, 'days').left,
                top: getEdgeInsets(screenSize, 'days').top,
                child: Text(
                  '$days',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFD9291C),
                    fontSize: fontSizes[0], // Access the days font size
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: const <Shadow>[
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
                left: getEdgeInsets(screenSize, 'hours').left,
                top: getEdgeInsets(screenSize, 'hours').top,
                child: Text(
                  hours.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFFB81D),
                    fontSize: fontSizes[
                        1], // Access the hours, minutes, seconds font size
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: const <Shadow>[
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
                left: getEdgeInsets(screenSize, 'minutes').left,
                top: getEdgeInsets(screenSize, 'minutes').top,
                child: Text(
                  minutes.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFFB81D),
                    fontSize: fontSizes[1], // Adjust this if needed
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: const <Shadow>[
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
                left: getEdgeInsets(screenSize, 'seconds').left,
                top: getEdgeInsets(screenSize, 'seconds').top,
                child: Text(
                  seconds.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFFFB81D),
                    fontSize: fontSizes[1], // Adjust this if needed
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    shadows: const <Shadow>[
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
