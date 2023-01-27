import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:blackout_tracker/models/device_information.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppData {
  DeviceInformation appData = DeviceInformation();
  final DateTime _currentDataTime = DateTime.now();
  final Battery _battery = Battery();
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult? _connectionStatus;
  BatteryState? _currentBatteryState;

  String? getCurrentData() {
    return appData.currentData =
        "${_currentDataTime.year}:${_currentDataTime.month}:${_currentDataTime.day}";
  }

  String getCurrentTime() {
    return appData.currentTime =
        "${_currentDataTime.hour}:${_currentDataTime.minute}:${_currentDataTime.second}";
  }

  Future<bool> isCharging() async {
    final state = await _battery.batteryState;
    return appData.isCharging = _currentBatteryState == state;
  }

  Future<int> getBatteryPercentage() async {
    return appData.batteryLevel = await _battery.batteryLevel;
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    return appData.isConnectedToWifi =
        _connectionStatus == ConnectivityResult.wifi;
  }

  Future<bool> tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      return appData.isConnected = response.isNotEmpty;
    } on SocketException {
      return appData.isConnected = false;
    }
  }
}
