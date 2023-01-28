import 'package:blackout_tracker/data/app_data.dart';
import 'package:blackout_tracker/data/app_shared_preferences.dart';

class Logic {
  AppData appData = AppData();
  AppSharedPreferences appSharedPreferences = AppSharedPreferences();

  Future<String> getAndSaveDate() async {
    String date = appData.getCurrentData();
    await appSharedPreferences.setDate(date);
    return date;
  }

  Future<String> getAndSaveTime() async {
    String time = appData.getCurrentTime();
    await appSharedPreferences.setDate(time);
    return time;
  }

  Future<int?> getAndSaveBatteryLevel() async {
    int? batteryLevel = await appData.getBatteryPercentage();
    await appSharedPreferences.setBatteryLevel(batteryLevel);
    return batteryLevel;
  }

  Future<String> getAndSaveChargingStatus() async {
    String chargingStatus =
        await appData.isCharging() ? 'Charging' : 'Not charging';
    await appSharedPreferences.setChargingStatus(chargingStatus);
    return chargingStatus;
  }

  Future<String> getAndSaveWifiConnectivityState() async {
    bool isConnectedToWifi = await appData.isConnectedToWiFi();
    await appSharedPreferences.setWifiConnectivityState(isConnectedToWifi);
    return isConnectedToWifi ? 'Connected' : 'No';
  }

  Future<String> getAndSaveInternetConnectivityState() async {
    bool isConnectionSuccessful = await appData.tryConnection();
    await appSharedPreferences
        .setInternetConnectivityState(isConnectionSuccessful);
    return isConnectionSuccessful ? 'Connected' : 'No';
  }
}
