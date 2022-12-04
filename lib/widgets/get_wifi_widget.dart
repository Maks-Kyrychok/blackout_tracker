import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class GetWifiWidget extends StatefulWidget {
  const GetWifiWidget({Key? key}) : super(key: key);

  @override
  State<GetWifiWidget> createState() => _GetWifiWidgetState();
}

class _GetWifiWidgetState extends State<GetWifiWidget> {
  bool? siConnected;
  ConnectivityResult? _connectionStatus;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Wi-Fi connected: ${_connectionStatus.toString()}');
  }
}
