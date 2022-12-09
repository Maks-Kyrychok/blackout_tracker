import 'package:blackout_tracker/widgets/check_internet_conection_widget.dart';
import 'package:blackout_tracker/widgets/get_battery_widget.dart';
import 'package:blackout_tracker/widgets/get_data_time_widget.dart';
import 'package:blackout_tracker/widgets/get_wifi_widget.dart';
import 'package:flutter/material.dart';

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
        GetWifiWidget(),
        CheckInternetConectionWidget(),
      ]),
    );
  }
}
