import 'package:eslami/home/hadeth/hadeth_tab.dart';
import 'package:eslami/home/hadeth/item_hadeth_details.dart';
import 'package:eslami/mytheme.dart';
import 'package:flutter/material.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        "assets/images/default_bg.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.06,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: MyTheme.whiteColor,
          ),
          child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return ItemHadethDetails(
                  content: args.content[index],
                );
              }),
        ),
      )
    ]);
  }
}
