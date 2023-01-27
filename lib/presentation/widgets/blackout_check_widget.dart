import 'package:battery_plus/battery_plus.dart';
import 'package:blackout_tracker/models/device_information.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BlackoutCheckWidget extends StatefulWidget {
  const BlackoutCheckWidget({super.key});

  @override
  State<BlackoutCheckWidget> createState() => _BlackoutCheckWidgetState();
}

class _BlackoutCheckWidgetState extends State<BlackoutCheckWidget> {
  DeviceInformation deviceInformation = DeviceInformation();
  final DateTime _currentDataTime = DateTime.now();
  final Battery _battery = Battery();
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult? _connectionStatus;
  BatteryState? _currentBatteryState;

  @override
  void initState() {
    _getCurrentData();
    _getCurrentTime();
    _initConnectivity();
    _tryConnection();
    _getBatteryPercentage();
    _isCharging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('${deviceInformation.currentData}'),
      Text('${deviceInformation.currentTime}'),
      Text('${deviceInformation.isCharging}'),
      Text('${deviceInformation.batteryLevel}'),
      Text('${deviceInformation.isConnectedToWifi}'),
      Text('${deviceInformation.isConnected}'),
    ]);
  }

  _getCurrentData() {
    deviceInformation.currentData =
        "${_currentDataTime.year}:${_currentDataTime.month}:${_currentDataTime.day}";
  }

  _getCurrentTime() {
    deviceInformation.currentTime =
        "${_currentDataTime.hour}:${_currentDataTime.minute}:${_currentDataTime.second}";
  }

  void _isCharging() async {
    final state = await _battery.batteryState;
    deviceInformation.isCharging = _currentBatteryState == state;
  }

  void _getBatteryPercentage() async {
    final level = await _battery.batteryLevel;
    deviceInformation.batteryLevel = level;
  }

  Future<void> _initConnectivity() async {
    late ConnectivityResult result;
    result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      deviceInformation.isConnectedToWifi =
          _connectionStatus == ConnectivityResult.wifi;
    });
  }

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        deviceInformation.isConnected = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      setState(() {
        deviceInformation.isConnected = false;
      });
    }
  }
}
