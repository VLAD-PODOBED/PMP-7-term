package com.example.lab4_5_pia

import android.content.Intent
import android.net.Uri
import android.content.IntentFilter
import android.os.BatteryManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.TimeZone

class MainActivity : FlutterActivity() {
    private val CHANNEL_TIMEZONE = "com.example.timezone/info" // Измените имя канала для часового пояса
    private val CHANNEL_BROWSER = "com.example.browser/launch"
    private val CHANNEL_BATTERY = "com.example.battery/level"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Метод канала для получения часового пояса
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_TIMEZONE).setMethodCallHandler { call, result ->
            if (call.method == "getTimeZone") {
                val timeZone = getTimeZone()
                result.success(timeZone)
            } else {
                result.notImplemented()
            }
        }

        // Метод канала для запуска браузера
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_BROWSER).setMethodCallHandler { call, result ->
            if (call.method == "launchBrowser") {
                val url = call.argument<String>("url")
                if (url != null) {
                    launchBrowser(url)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "URL is null", null)
                }
            } else {
                result.notImplemented()
            }
        }

        // Метод канала для получения уровня заряда батареи
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_BATTERY).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                result.success(batteryLevel)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getTimeZone(): String {
        return TimeZone.getDefault().id // Получаем ID часового пояса
    }

    private fun launchBrowser(url: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        startActivity(intent)
    }

    private fun getBatteryLevel(): Int {
        val batteryIntent = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { intentFilter ->
            registerReceiver(null, intentFilter)
        }
        val level = batteryIntent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = batteryIntent?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1
        return (level * 100) / scale // Возвращаем уровень заряда как процент
    }
}
