import 'package:blackout_tracker/core/platform/network_info.dart';
import 'package:blackout_tracker/models/device_information.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:workmanager/workmanager.dart';

class BlackoutCheckWidget extends StatefulWidget {
  const BlackoutCheckWidget({super.key});

  @override
  State<BlackoutCheckWidget> createState() => _BlackoutCheckWidgetState();
}

class _BlackoutCheckWidgetState extends State<BlackoutCheckWidget> {
  List<DeviceInformationModel> deviceInformationList = [];

  final DateTime _currentDataTime = DateTime.now();
  final Battery _battery = Battery();
  final Connectivity _connectivity = Connectivity();
  bool? _connectionStatus;
  final BatteryState _currentBatteryState = BatteryState.charging;
  // late final NetworkInfo networkInfo;
  DeviceInformationModel? deviceInformation;

  @override
  void initState() {
    getDeviceInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('$_getCurrentData()'),
      Text('$_getCurrentTime()'),
      Text('$_isCharging()'),
      Text('$_getBatteryPercentage()'),
      Text('$_initConnectivity()'),
      Text('$_connectionStatus'),
    ]);
  }

  getDeviceInformation() {
    deviceInformation = DeviceInformationModel(
        currentData: _getCurrentData(),
        currentTime: _getCurrentTime(),
        isCharging: _isCharging(),
        batteryLevel: _getBatteryPercentage(),
        isConnectedToWifi: _initConnectivity(),
        isConnected: _connectionStatus);
  }

  String _getCurrentData() {
    return "${_currentDataTime.year}:${_currentDataTime.month}:${_currentDataTime.day}";
  }

  String _getCurrentTime() {
    return "${_currentDataTime.hour}:${_currentDataTime.minute}:${_currentDataTime.second}";
  }

  Future<bool> _isCharging() async {
    final state = await _battery.batteryState;
    return _currentBatteryState == state;
  }

  Future<int> _getBatteryPercentage() async {
    return await _battery.batteryLevel;
  }

  Future<bool> _initConnectivity() async {
    late ConnectivityResult result;
    result = await _connectivity.checkConnectivity();
    return ConnectivityResult.wifi == result;
  }

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        _connectionStatus = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      setState(() {
        _connectionStatus = false;
      });
    }
  }
}
