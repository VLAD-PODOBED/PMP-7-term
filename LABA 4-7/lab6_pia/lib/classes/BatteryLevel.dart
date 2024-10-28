import 'package:flutter/services.dart';

class BatteryLevel {
  static const MethodChannel _channel = MethodChannel('com.example.battery/level');

  static Future<int?> getBatteryLevel() async {
    try {
      final int? batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      print("Failed to get battery level: '${e.message}'.");
      return null;
    }
  }
}