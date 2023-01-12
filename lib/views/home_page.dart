import 'dart:math';

import 'package:bmi_calculator_flutter/components/alert_dialog.dart';
import 'package:bmi_calculator_flutter/components/calculate_button.dart';
import 'package:bmi_calculator_flutter/components/maie_female.dart';
import 'package:bmi_calculator_flutter/components/weiht_age.dart';
import 'package:bmi_calculator_flutter/views/slider.dart';
import 'package:bmi_calculator_flutter/utils/app_colors.dart';
import 'package:bmi_calculator_flutter/utils/app_styles.dart';
import 'package:bmi_calculator_flutter/utils/app_text.dart';
import 'package:flutter/material.dart';
import '../components/status_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFemale = false;
  double height = 180;
  int weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          AppText.appBarTitle,
          style: AppTextStyles.textWhiteF22,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFemale = false;
                        });
                      },
                      child: MaleFemale(
                        icon: Icons.male,
                        text: AppText.male,
                        isFemale: !isFemale,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFemale = true;
                        });
                      },
                      child: MaleFemale(
                        icon: Icons.female,
                        text: AppText.female,
                        isFemale: isFemale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StatusCard(
              child: SliderWidget(
                currentSliderValue: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    child: WeightAge(
                      name: AppText.weight,
                      value: weight,
                      remove: (maani) {
                        setState(() {
                          weight = maani;
                        });
                      },
                      add: (maani) {
                        setState(() {
                          weight = maani;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  StatusCard(
                    child: WeightAge(
                      name: AppText.age,
                      value: age,
                      remove: (maani) {
                        setState(() {
                          age = maani;
                        });
                      },
                      add: (maani) {
                        setState(() {
                          age = maani;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalculateButton(
        onTap: () {
          final result = weight / pow(height / 100, 2);
          if (result < 18.5) {
            showMyDialog(
                context: context,
                text: 'Сиздин салмагыныз аз. Озунузго караныз.');
          } else if (result >= 18.5 && result <= 24.9) {
            showMyDialog(
              context: context,
              text: 'Салмагыныз жакшы. Молодец.',
            );
          } else if (result > 24.9) {
            showMyDialog(
                context: context,
                text: 'Сизде ашыкча салмак. Озунузго жакшы караныз.');
          } else {
            showMyDialog(
                context: context, text: 'Маалымат алууда катачылык бар');
          }
        },
      ),
    );
  }
}
