import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "com.example.battery/level",
                                                  binaryMessenger: controller.binaryMessenger)

        batteryChannel.setMethodCallHandler { (call, result) in
            if call.method == "getBatteryLevel" {
                self.getBatteryLevel(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        // Включаем мониторинг заряда батареи
        UIDevice.current.isBatteryMonitoringEnabled = true

        GeneratedPluginRegistrant.register(with: self)
        return true
    }

    private func getBatteryLevel(result: @escaping FlutterResult) {
        let batteryLevel = UIDevice.current.batteryLevel
        if batteryLevel < 0 {
            result(FlutterError(code: "UNAVAILABLE", message: "Уровень заряда батареи недоступен", details: nil))
        } else {
            result(Int(batteryLevel * 100)) // Возвращаем уровень заряда как процент
        }
    }
}
