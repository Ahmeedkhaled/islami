import 'package:eslami/home/quran/item_soura_details.dart';
import 'package:eslami/home/quran/item_soura_name.dart';
import 'package:eslami/mytheme.dart';
import 'package:eslami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran_details";

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SouraNameargs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.isDarkMode()!
          ? Image.asset(
              "assets/images/dark_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "assets/images/default_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.name}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.06,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
                  color: provider.isDarkMode()!
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor,
                ),
          child: ListView.builder(
              itemCount: verses.length,
              itemBuilder: (context, index) {
                return ItemSouraDetails(
                    content: verses[index], index: index);
              }),
        ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

class SouraNameargs {
  String name;
  int index;

  SouraNameargs({required this.name, required this.index});
}
