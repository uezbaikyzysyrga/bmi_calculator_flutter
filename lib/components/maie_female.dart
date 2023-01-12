import 'package:bmi_calculator_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({
    Key? key,
    required this.icon,
    required this.text,
    required this.isFemale,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final bool isFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: isFemale
              ? AppColors.whiteColor
              : const Color.fromARGB(255, 81, 81, 85),
        ),
        Text(text, style: AppTextStyles.textGreyF22),
      ],
    );
  }
}
