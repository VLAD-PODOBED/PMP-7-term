import 'package:flutter/services.dart';

class TimeZone {
  static const MethodChannel _channel = MethodChannel('com.example.timezone/info');

  static Future<String?> getTimeZone() async {
    try {
      final String? timeZone = await _channel.invokeMethod('getTimeZone');
      return timeZone;
    } on PlatformException catch (e) {
      print("Failed to get time zone: '${e.message}'.");
      return null;
    }
  }
}
