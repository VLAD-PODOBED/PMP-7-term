import 'package:flutter/material.dart';
import 'package:lab4_5_pia/classes/TimeZone.dart';
import 'classes/BatteryLevel.dart';
import 'classes/BrowserLaunch.dart';
import 'components/ImagePageView.dart';

class lab6 extends StatelessWidget {
  const lab6({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            children:[
              const Text("Lab6"),
            ]
        ),
      ),
      body: Column(
        children: [
          //Лаба 6 завдание 3-5
          ElevatedButton(
            onPressed: () async {
              String? timeZone = await TimeZone.getTimeZone();
              print("Battery level: $timeZone%");
            },
            child: Text("Get Battery Level"),
          ),
          ElevatedButton(
            onPressed: () {
              BrowserLauncher.launchBrowser("https://www.example.com");
            },
            child: Text("Open Browser"),
          ),
          ElevatedButton(
            onPressed: () async {
              int? batteryLevel = await BatteryLevel.getBatteryLevel();
              print("Battery level: $batteryLevel%");
            },
            child: Text("Get Battery Level"),
          ),
          ImagePageViewer(
            imageUrls: [
              'assets/images/food.jpg',
              'assets/images/food.jpg',
              'assets/images/food.jpg',
            ],
          ),
        ],
      ),
    );
  }
}

