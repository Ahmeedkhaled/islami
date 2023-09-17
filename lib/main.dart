import 'package:eslami/home/hadeth/hadeth_details.dart';
import 'package:eslami/home/home_page.dart';
import 'package:eslami/mytheme.dart';
import 'package:eslami/home/quran/quran_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        QuranDetails.routeName: (context) => QuranDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("ar"),
      theme: MyTheme.lightMode,
    );
  }

}
