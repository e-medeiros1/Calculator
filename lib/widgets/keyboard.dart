import 'dart:ui';

import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/button_row_widget.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.cb}) : super(key: key);

  final void Function(String) cb;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF170724),
      height: size.height * 0.55,
      child: Column(
        children: [
          ButtonRowWidget(buttons: [
            Button.especials(text: 'C', cb: cb),
            Button.especials(text: '⌫', cb: cb),
            Button.especials(text: '%', cb: cb),
            Button.operation(text: '÷', cb: cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '7', cb: cb),
            Button(text: '8', cb: cb),
            Button(text: '9', cb: cb),
            Button.operation(text: 'x', cb: cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '4', cb: cb),
            Button(text: '5', cb: cb),
            Button(text: '6', cb: cb),
            Button.operation(text: '+', cb: cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '1', cb: cb),
            Button(text: '2', cb: cb),
            Button(text: '3', cb: cb),
            Button.operation(text: '-', cb: cb),
          ]),
          ButtonRowWidget(buttons: [
            Button.big(text: '0', cb: cb),
            Button(text: '.', cb: cb),
            Button.operation(text: '=', cb: cb),
          ]),
        ],
      ),
    );
  }
}
