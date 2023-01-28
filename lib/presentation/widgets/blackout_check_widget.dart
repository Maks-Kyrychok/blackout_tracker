import 'package:blackout_tracker/common/app_colors.dart';
import 'package:blackout_tracker/data/logic.dart';
import 'package:flutter/material.dart';

class BlackoutCheckWidget extends StatefulWidget {
  const BlackoutCheckWidget({super.key});

  @override
  State<BlackoutCheckWidget> createState() => _BlackoutCheckWidgetState();
}

class _BlackoutCheckWidgetState extends State<BlackoutCheckWidget> {
  Logic logic = Logic();

  String date = '';
  String time = '';
  int batteryLevel = -1;
  String chargingStatus = '';
  String wifiState = '';
  String internetConectionState = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.cellBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text('Date: $date'),
          const SizedBox(
            height: 10,
          ),
          Text('Time: $time'),
          const SizedBox(
            height: 10,
          ),
          Text('Battery level: $batteryLevel'),
          const SizedBox(
            height: 10,
          ),
          Text('Charging status: $chargingStatus'),
          const SizedBox(
            height: 10,
          ),
          Text('Wi-Fi connection: $wifiState'),
          const SizedBox(
            height: 10,
          ),
          Text('Internet connection: $internetConectionState'),
        ]),
      ),
    );
  }

  void getData() async {
    date = await logic.getAndSaveDate();
    time = await logic.getAndSaveTime();
    batteryLevel = (await logic.getAndSaveBatteryLevel())!;
    chargingStatus = await logic.getAndSaveChargingStatus();
    wifiState = await logic.getAndSaveWifiConnectivityState();
    internetConectionState = await logic.getAndSaveInternetConnectivityState();
    setState(() {});
  }
}
