import 'dart:math';

import 'package:eslami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  List<String> names = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Center(
                child: provider.isDarkMode()!
                    ? Image.asset("assets/images/head_sebha_dark.png")
                    : Image.asset("assets/images/head_sebha_logo.png")),
            Center(
                child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.09),
                  child: GestureDetector(
                onTap: () {
                  onTab();
                },
                child: Transform.rotate(
                  angle: angle,
                  child: provider.isDarkMode()!
                      ? Image.asset(
                          "assets/images/body_sebha_dark.png",
                        )
                      : Image.asset(
                          "assets/images/body_sebha_logo.png",
                        ),
                ),
              ),
            )),
          ],
        ),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: 69,
          height: 81,
          decoration: BoxDecoration(
              color: provider.isDarkMode()!
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text("$counter",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center)),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: provider.isDarkMode()!
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
          ),
          width: 115,
          height: 40,
          child: Text(
            names[index],
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  void onTab() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == names.length) {
      index = 0;
    }
    angle++;
    setState(() {});
  }
}
