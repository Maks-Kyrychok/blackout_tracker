import 'package:blackout_tracker/widgets/blackout_check_widget.dart';
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
        BlackoutCheckWidget(),
      ]),
    );
  }
}
