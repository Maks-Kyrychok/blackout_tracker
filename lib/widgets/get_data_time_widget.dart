import 'package:flutter/material.dart';

class GetDataTimeWidget extends StatefulWidget {
  const GetDataTimeWidget({Key? key}) : super(key: key);

  @override
  State<GetDataTimeWidget> createState() => _GetDataTimeWidgetState();
}

class _GetDataTimeWidgetState extends State<GetDataTimeWidget> {
  final DateTime currentTime = DateTime(0);
  @override
  void initState() {
    super.initState();
    _getCurrentTimeData();
  }

  _getCurrentTimeData() {
    DateTime currentTime = DateTime.now();
    return currentTime.toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    return Text(currentTime.toIso8601String());
  }
}
