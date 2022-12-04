import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class GetBatteryWidget extends StatefulWidget {
  const GetBatteryWidget({super.key});

  @override
  State<GetBatteryWidget> createState() => _GetBatteryWidgetState();
}

class _GetBatteryWidgetState extends State<GetBatteryWidget> {
  final Battery _battery = Battery();
  BatteryState currentBatteryState = BatteryState.charging;
  bool? isCharging;
  int _percentage = 0;

  @override
  void initState() {
    super.initState();
    _getBatteryPercentage();
    _isCharging();
  }

  void _isCharging() async {
    final state = await _battery.batteryState;
    isCharging = currentBatteryState == state;

    setState(() {});
  }

  void _getBatteryPercentage() async {
    final level = await _battery.batteryLevel;
    _percentage = level;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Battery level: $_percentage, Device charging: $isCharging',
    );
  }
}
