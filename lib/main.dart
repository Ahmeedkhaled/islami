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
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    saveData();
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

  Future<void> saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = await prefs.getString("language");
    if (language != null) {
      provider.changeLanguage(language);
    }
    var isDark = prefs.getString("isDark");
    if (isDark == "dark") {
      provider.changeTheme(ThemeMode.dark);
    } else if (isDark == "light") {
      provider.changeTheme(ThemeMode.light);
    }
  }
}
