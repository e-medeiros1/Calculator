import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

class ButtonRowWidget extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRowWidget({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}
