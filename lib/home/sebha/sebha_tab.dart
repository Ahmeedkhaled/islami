import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset("assets/images/head_sebha_logo.png")),
        Center(
            child: InkWell(
                onTap: () {
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
                child: Image.asset("assets/images/body_sebha_logo.png"))),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          width: 69,
          height: 81,
          decoration: BoxDecoration(
              color: Color(0xffB7935F),
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
            color: Theme.of(context).primaryColor,
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
