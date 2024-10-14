import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/constants/styles.dart';
import 'package:phucbh_resume/utils/asset_helper.dart';

import '../constants/about_items.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // education
        ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bachelor of Software Engineering',
                      style:
                          AppTextStyle.title.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'FPT University (HCMC Campus) | 2020 - 2024',
                      style: AppTextStyle.body.copyWith(
                        color: AppColors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Expected Graduation: Nov 2024',
                      style: AppTextStyle.body.copyWith(
                          color: AppColors.white.withOpacity(0.3),
                          fontStyle: FontStyle.italic),
                    ),

                    // fptu logo
                    const SizedBox(height: 45),
                    Image.asset(
                      AssetHelper.fptuImage,
                      width: 100,
                    ),
                  ],
                ),
              ],
            )),

        const SizedBox(width: 50),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.45,
            ),
            child: Column(
              children: [
                // Wrap for skillItems
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.center,
                  clipBehavior: Clip.antiAlias,
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
                        avatar: Image.asset(skillItems[i]["img"]),
                      ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                // Separate Wrap for coreSkillItems
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  alignment: WrapAlignment.center,
                  clipBehavior: Clip.antiAlias,
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
                        label: Text(coreSkillItems[i],
                            style: const TextStyle(color: AppColors.white)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
