import 'package:eslami/home/quran/quran_details.dart';
import 'package:flutter/material.dart';

class ItemSouraName extends StatelessWidget {
  String name;
  int index;

  ItemSouraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          QuranDetails.routeName,
          arguments: SouraNameargs(name: name, index: index),
        );
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
