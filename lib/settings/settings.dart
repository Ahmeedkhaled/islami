import 'package:eslami/provider/app_config_provider.dart';
import 'package:eslami/settings/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.appLanguage == "en" ?
            AppLocalizations.of(context)!.language :
            AppLocalizations.of(context)!.language,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "en" ?
                    AppLocalizations.of(context)!.english :
                    AppLocalizations.of(context)!.arabic
                    ,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
