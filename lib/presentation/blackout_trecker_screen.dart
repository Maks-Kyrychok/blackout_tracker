import 'package:blackout_tracker/presentation/widgets/blackout_check_widget.dart';
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: const [
            BlackoutCheckWidget(),
          ]),
        ),
      ),
    );
  }
}
