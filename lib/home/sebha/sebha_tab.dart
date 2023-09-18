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
  String name = "سبحان الله";
  double _rotation = 0;

  void _onPressed() {
    setState(() {
      _rotation = _rotation + (pi / 4 + new Random().nextInt(100));
    });
  }

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
              child: InkWell(
                onTap: () {
                  _rotation;
                  counter++;
                  if (counter < 34) {
                    name = "سبحان الله";
                  } else if (counter < 67) {
                    name = "الحمدلله";
                  } else if (counter < 100) {
                    name = "الله اكبر";
                  } else if (counter == 100) {
                    counter = 0;
                    name = "سبحان الله";
                  }
                      setState(() {});
                    },
                    child: Transform.rotate(
                  angle: _rotation,
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
            "$name",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
