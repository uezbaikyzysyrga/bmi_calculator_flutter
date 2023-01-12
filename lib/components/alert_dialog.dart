import 'package:bmi_calculator_flutter/utils/app_colors.dart';
import 'package:bmi_calculator_flutter/utils/app_styles.dart';
import 'package:bmi_calculator_flutter/utils/app_text.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(
    {required BuildContext context, required String text}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          AppText.appBarTitle,
          style: AppTextStyles.textWhiteF22,
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                text,
                style: AppTextStyles.textWhiteF20,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Кайра эсептениз.'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
