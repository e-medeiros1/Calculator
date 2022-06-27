import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayScreenWidget extends StatelessWidget {
  final String textDisplay;

  const DisplayScreenWidget({Key? key, required this.textDisplay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Ocupa toda a dimensão da tela
      flex: 1,
      child: Container(
        color: const Color(0xFF170724),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Padding(
                padding:  EdgeInsets.only(right: 12),
                child: Text(
                  textDisplay,
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0x66FFFFFF),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                textDisplay,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
