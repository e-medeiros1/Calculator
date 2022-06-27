// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DEFAULT = Color(0xFF170724);
  static const OPERATION = Color(0xFF7344B2);
  static const ESPECIAL = Color(0xFFE8B12B);
  //Modo light 825BB8

  final TextStyle? textStyle;
  final String text;
  final bool big;
  Color? color;
  final void Function(String) cb;

  Button({
    Key? key,
    required this.text,
    this.big = false,
    this.color = DEFAULT,
    this.textStyle = const TextStyle(
      color: OPERATION,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    ),
    required this.cb,
  }) : super(key: key);

  Button.operation({
    Key? key,
    required this.text,
    this.big = false,
    this.color = OPERATION,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 40,
    ),
    required this.cb,
  }) : super(key: key);

  Button.big({
    Key? key,
    required this.text,
    this.big = true,
    this.color = DEFAULT,
    this.textStyle = const TextStyle(
      color: OPERATION,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    ),
    required this.cb,
  }) : super(key: key);
  Button.especials({
    Key? key,
    required this.text,
    this.big = false,
    this.color = DEFAULT,
    this.textStyle = const TextStyle(
      color: ESPECIAL,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    ),
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () => cb(text),
          style: ButtonStyle(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
