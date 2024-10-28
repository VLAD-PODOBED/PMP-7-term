import 'package:flutter/services.dart';

class BrowserLauncher {
  static const MethodChannel _channel = MethodChannel('com.example.browser/launch');

  static Future<void> launchBrowser(String url) async {
    try {
      await _channel.invokeMethod('launchBrowser', {'url': url});
    } on PlatformException catch (e) {
      print("Failed to launch browser: '${e.message}'.");
    }
  }
}