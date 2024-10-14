import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/about_items.dart';
import '../constants/styles.dart';
import '../utils/asset_helper.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Bachelor of Software Engineering',
          style:
              AppTextStyle.title.copyWith(color: AppColors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          'FPT University (HCMC Campus) | 2020 - 2024',
          style: AppTextStyle.body
              .copyWith(color: AppColors.white, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 10),
        Text(
          'Expected Graduation: Nov 2024',
          style: AppTextStyle.body.copyWith(
            color: AppColors.white.withOpacity(0.3),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 45),
        Image.asset(
          AssetHelper.fptuImage,
          width: 100,
        ),
        const SizedBox(height: 50),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < skillItems.length; i++)
              Chip(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: AppColors.textColor,
                label: Text(skillItems[i]["title"],
                    style: const TextStyle(color: AppColors.white)),
                avatar: Image.asset(
                  skillItems[i]["img"],
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
        const SizedBox(height: 35),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < coreSkillItems.length; i++)
              Chip(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: AppColors.textColor,
                label: Text(
                  coreSkillItems[i],
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
          ],
        )
      ],
    );
  }
}
