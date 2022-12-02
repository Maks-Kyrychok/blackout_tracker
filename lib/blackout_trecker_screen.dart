import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BlackoutTreckerScreen extends StatelessWidget {
  const BlackoutTreckerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackout Trecker'),
        centerTitle: true,
      ),
      body: Column(children: const [
        GetDataTimeWidget(),
        GetBatteryWidget(),
      ]),
    );
  }
}

class GetDataTimeWidget extends StatefulWidget {
  const GetDataTimeWidget({Key? key}) : super(key: key);

  @override
  State<GetDataTimeWidget> createState() => _GetDataTimeWidgetState();
}

class _GetDataTimeWidgetState extends State<GetDataTimeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    return Text(currentTime.toIso8601String());
  }
}

class GetBatteryWidget extends StatefulWidget {
  const GetBatteryWidget({super.key});

  @override
  State<GetBatteryWidget> createState() => _GetBatteryWidgetState();
}

class _GetBatteryWidgetState extends State<GetBatteryWidget> {
  var battery = Battery();
  int percentage = 0;

  @override
  void initState() {
    super.initState();
    getBatteryPerentage();
  }

  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
    percentage = level;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text('$percentage');
  }
}
