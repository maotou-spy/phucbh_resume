// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

import '../utils/asset_helper.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.onHireMeTap,
  });

  final VoidCallback onHireMeTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        constraints: const BoxConstraints(minHeight: 500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  // Thêm SingleChildScrollView vào đây
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                          fontSize: 70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Backend & Flutter Developer',
                        style: AppTextStyle.subtitle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'A passionate software engineer seeking to develop as a backend and mobile developer. Eager to learn and ready to face challenges to enhance skills. Determined to contribute to the company\'s growth by building a robust backend and high-quality mobile applications.',
                        style: AppTextStyle.body.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onHireMeTap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.15,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Hire Me',
                                style: AppTextStyle.title,
                              ),
                            ),
                          ),
                          const SizedBox(width: 45),
                          GestureDetector(
                            onTap: () async {
                              const url =
                                  'assets/lib/assets/others/phucbh_CV.pdf';

                              html.AnchorElement(href: url)
                                ..setAttribute('download', 'Phucbh_CV.pdf')
                                ..click();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.15,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: AppColors.outlinedButtonColor,
                                ),
                              ),
                              child: Text(
                                'Download CV',
                                style: AppTextStyle.title,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Flexible(
              flex: 3,
              child: Transform.scale(
                scale: 1.7,
                child: Image.asset(
                  AssetHelper.phucbhImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
