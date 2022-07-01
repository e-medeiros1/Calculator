import 'dart:ui';

import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/button_row_widget.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key, required this.cb}) : super(key: key);

  final void Function(String) cb;

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  // bool _themeSwitch = true;

  // Widget buildSwitch() => Switch(
  //     value: _themeSwitch,
  //     onChanged: (_themeSwitch) {
  //       setState(() => this._themeSwitch = _themeSwitch);
  //     });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF170724),
      height: size.height * 0.55,
      child: Column(
        children: [
          ButtonRowWidget(buttons: [
            Button.especials(text: 'C', cb: widget.cb),
            Button.especials(text: '⌫', cb: widget.cb),
            Button.especials(text: '%', cb: widget.cb),
            Button.operation(text: '÷', cb: widget.cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '7', cb: widget.cb),
            Button(text: '8', cb: widget.cb),
            Button(text: '9', cb: widget.cb),
            Button.operation(text: 'x', cb: widget.cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '4', cb: widget.cb),
            Button(text: '5', cb: widget.cb),
            Button(text: '6', cb: widget.cb),
            Button.operation(text: '-', cb: widget.cb),
          ]),
          ButtonRowWidget(buttons: [
            Button(text: '1', cb: widget.cb),
            Button(text: '2', cb: widget.cb),
            Button(text: '3', cb: widget.cb),
            Button.operation(text: '+', cb: widget.cb),
          ]),
          ButtonRowWidget(buttons: [
            Button.big(text: '0', cb: widget.cb),
            Button(text: '.', cb: widget.cb),
            Button.operation(text: '=', cb: widget.cb),
          ]),
        ],
      ),
    );
  }
}
