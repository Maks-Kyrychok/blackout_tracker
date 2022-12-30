import 'package:flutter/material.dart';

import 'blackout_trecker_screen.dart';
import 'package:workmanager/workmanager.dart';


const fetchBackground = "fetchBackground";
@pragma(
    'vm:entry-point') 
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        // Code to run in background
        break;
    }
    return Future.value(true);
  });
}

void main() {
  runApp(const MaterialApp(home: BlackoutTreckerScreen()));
}
