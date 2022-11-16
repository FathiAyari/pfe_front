import 'package:cypros_comparator/util/color_resources.dart';
import 'package:cypros_comparator/util/dimensions.dart';
import 'package:cypros_comparator/util/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cypros_comparator/util/extensions.dart';

class CurrencyDialog extends StatelessWidget {
  const CurrencyDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int index = context.supportedLocales.indexOf(context.locale);
    return Dialog(
      backgroundColor: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 300,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Text(tr('language'), style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              ),
              SizedBox(
                  height: 150,
                  child: Builder(
                    builder: (context) {
                      List<Locale> _valueList = context.supportedLocales;
                      return CupertinoPicker(
                        itemExtent: 40,
                        useMagnifier: true,
                        magnification: 1.2,
                        scrollController:
                            FixedExtentScrollController(initialItem: index),
                        onSelectedItemChanged: (int i) {
                          index = i;
                        },
                        children: _valueList.map((value) {
                          return Center(
                              child: Text(value.toLanguageFullName(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color)));
                        }).toList(),
                      );
                    },
                  )),
              Divider(
                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  color: ColorResources.getHintColor(context)),
              Row(children: [
                Expanded(
                    child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(tr('cancel'),
                      style: poppinsRegular.copyWith(
                          color: ColorResources.getYellow(context))),
                )),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: VerticalDivider(
                      width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      color: Theme.of(context).hintColor),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    context.setLocale(context.supportedLocales[index]);
                    Navigator.pop(context);
                  },
                  child: Text(tr('ok'),
                      style: poppinsRegular.copyWith(
                          color: ColorResources.getGreen(context))),
                )),
              ]),
            ]),
      ),
    );
  }
}
