import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayScreenWidget extends StatefulWidget {
  final String textDisplay;

  const DisplayScreenWidget({Key? key, required this.textDisplay})
      : super(key: key);

  @override
  State<DisplayScreenWidget> createState() => _DisplayScreenWidgetState();
}

ThemeData darkMode =
    ThemeData(scaffoldBackgroundColor: const Color(0xFF170724));
ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.white,
);

class _DisplayScreenWidgetState extends State<DisplayScreenWidget> {
  // bool themeSwitch = true;

  // Widget buildSwitch() => Switch(
  //     value: themeSwitch,
  //     onChanged: (themeSwitch) {
  //       setState(() => this.themeSwitch = themeSwitch);
  //     });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color(0xFF170724),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   child: buildSwitch(),
            //   alignment: Alignment.topRight,
            //   padding: const EdgeInsets.only(top: 20, right: 20),
            // ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10),
              child: AutoSizeText(
                widget.textDisplay,
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
