import 'package:bmi_calculator_flutter/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class WeightAge extends StatelessWidget {
  const WeightAge({
    Key? key,
    required this.name,
    required this.value,
    required this.remove,
    required this.add,
  }) : super(key: key);
  final String name;
  final int value;
  final void Function(int) remove;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: AppTextStyles.textWhiteF22,
        ),
        Text(
          '$value',
          style: AppTextStyles.textWhiteF50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RemoveAddButton(
              iconData: Icons.remove,
              onPressed: () => remove(value - 1),
            ),
            const SizedBox(width: 20),
            RemoveAddButton(
              iconData: Icons.add,
              onPressed: () => add(value + 1),
            ),
          ],
        )
      ],
    );
  }
}

class RemoveAddButton extends StatelessWidget {
  const RemoveAddButton({
    Key? key,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);
  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.button2color,
      foregroundColor: AppColors.whiteColor,
      onPressed: onPressed,
      child: Icon(iconData, size: 30),
    );
  }
}
