import 'package:blackout_tracker/presentation/custom_theme/custom_theme.dart';
import 'package:flutter/material.dart';

import 'presentation/blackout_trecker_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: CustomTheme.darkTheme, home: const BlackoutTreckerScreen()));
}
