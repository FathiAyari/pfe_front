import 'package:cypros_comparator/provider/theme_provider.dart';
import 'package:cypros_comparator/theme/theme_reference.dart';
import 'package:cypros_comparator/util/dimensions.dart';
import 'package:cypros_comparator/util/styles.dart';
import 'package:cypros_comparator/view/base/custom_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currency_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1170,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            children: [
              SwitchListTile(
                value: context.isDark,
                onChanged: (bool isActive) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
                title: Text(tr('dark_theme'),
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE)),
              ),
              TitleButton(
                icon: Icons.language,
                title: tr('choose_language'),
                onTap: () =>
                    showAnimatedDialog(context, const CurrencyDialog()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const TitleButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title,
          style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
      onTap: onTap,
    );
  }
}
