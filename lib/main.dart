import 'package:eslami/home/hadeth/hadeth_details.dart';
import 'package:eslami/home/home_page.dart';
import 'package:eslami/mytheme.dart';
import 'package:eslami/home/quran/quran_details.dart';
import 'package:eslami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
    );
  }

  Future<void> saveData(BuildContext context) async {
    var provider = Provider.of<AppConfigProvider>(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', provider.appLanguage);
    prefs.setString('theme', provider.appTheme as String);

    String? stringValue = prefs.getString('language');
    String? intValue = prefs.getString('theme');
  }
}
