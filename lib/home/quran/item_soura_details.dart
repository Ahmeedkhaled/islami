import 'package:eslami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemSouraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSouraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return provider.isDarkMode()!
        ? Text(
            '$content {${index + 1}}',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          )
        : Text(
            '$content {${index + 1}}',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          );
  }
}
