import 'package:eslami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode()!
                ? getItemSelected(context, AppLocalizations.of(context)!.dark)
                : getItemUnSelected(
                    context, AppLocalizations.of(context)!.dark)),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? getItemSelected(context, AppLocalizations.of(context)!.light)
                : getItemUnSelected(
                    context, AppLocalizations.of(context)!.light)),
      ],
    );
  }

  Widget getItemSelected(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget getItemUnSelected(BuildContext context, String text) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
