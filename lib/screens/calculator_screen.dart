import 'package:calculator/models/brain.dart';
import 'package:calculator/widgets/display_screen_widget.dart';
import 'package:calculator/widgets/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final Brain brain = Brain();

  _onPressed(String command) {
    setState(() {
      brain.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        body: Column(
      children: [
        DisplayScreenWidget(
          textDisplay:
              brain.value.isEmpty ? brain.value : brain.showHistory(),
        ),
        Keyboard(cb: _onPressed),
      ],
    ));
  }
}
