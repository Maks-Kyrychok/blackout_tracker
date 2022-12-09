import 'package:flutter/material.dart';
import 'dart:io';

class CheckInternetConectionWidget extends StatefulWidget {
  const CheckInternetConectionWidget({super.key});

  @override
  State<CheckInternetConectionWidget> createState() =>
      _CheckInternetConectionWidgetState();
}

class _CheckInternetConectionWidgetState
    extends State<CheckInternetConectionWidget> {
  bool? _isConnectionSuccessful;

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      setState(() {
        _isConnectionSuccessful = false;
      });
    }
  }

  @override
  void initState() {
    _tryConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Internet conection: $_isConnectionSuccessful');
  }
}
