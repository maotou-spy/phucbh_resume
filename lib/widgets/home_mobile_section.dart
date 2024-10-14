// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/utils/asset_helper.dart';

import '../constants/styles.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
    required this.onHireMeTap,
  });

  final VoidCallback onHireMeTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // avatar img
            Image.asset(
              AssetHelper.phucbhImage,
              width: screenWidth,
            ),
            const SizedBox(height: 30),
            // intro message
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, I am',
                  style: AppTextStyle.subtitle
                      .copyWith(color: AppTextStyle.body.color),
                ),
                const SizedBox(height: 8),
                Text(
                  'Phuc, Bui Huu',
                  style: AppTextStyle.title.copyWith(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Backend & Flutter Developer',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 16),
                Container(
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
                  child: Text(
                    'A passionate software engineer seeking to develop as a backend and mobile developer. Eager to learn and ready to face challenges to enhance skills. Determined to contribute to the company\'s growth by building a robust backend and high-quality mobile applications.',
                    style: AppTextStyle.body.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 45),
            // contact btn
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onHireMeTap();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.25,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Hire Me',
                      style: AppTextStyle.subtitle.copyWith(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () async {
                    const url = 'assets/lib/assets/others/Phucbh\'s_CV.pdf';

                    html.AnchorElement(href: url)
                      ..setAttribute('download', 'Phucbh_CV.pdf')
                      ..click();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.35,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.outlinedButtonColor,
                      ),
                    ),
                    child: Text(
                      'Download CV',
                      style: AppTextStyle.subtitle.copyWith(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
