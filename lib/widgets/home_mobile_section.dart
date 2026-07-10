import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/utils/asset_helper.dart';

import '../constants/styles.dart';
import '../utils/url_helper.dart';

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
                  'Fullstack Test Engineer | Automation Test Engineer',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 16),
                Container(
                  constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
                  child: Text(
                    'Fullstack Test Engineer with proven experience testing large‑scale backend systems and APIs. Skilled in manual and automation testing, API validation, requirement analysis, and SQL verification. Leveraging a strong development background, collaborates closely with developers to improve release stability and reduce defect leakage, ensuring high‑quality, reliable software deliveries.',
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
                      'Get in Touch',
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
                    final resumeUrl = dotenv.get('RESUME_URL');
                    await UrlHelper.openUrl(resumeUrl);
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
                      'My Resume',
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
