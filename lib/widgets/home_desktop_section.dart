import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/asset_helper.dart';
import '../utils/url_helper.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.onGetInTouch,
  });

  final VoidCallback onGetInTouch;

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
                        'Fullstack Test Engineer | Automation Test Engineer',
                        style: AppTextStyle.subtitle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Fullstack Test Engineer with proven experience testing large‑scale backend systems and APIs. Skilled in manual and automation testing, API validation, requirement analysis, and SQL verification. Leveraging a strong development background, collaborates closely with developers to improve release stability and reduce defect leakage, ensuring high‑quality, reliable software deliveries.',
                        style: AppTextStyle.body.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onGetInTouch();
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
                                'Get in Touch',
                                style: AppTextStyle.title,
                              ),
                            ),
                          ),
                          const SizedBox(width: 45),
                          GestureDetector(
                            onTap: () async {
                              final resumeUrl = dotenv.get('RESUME_URL');
                              await UrlHelper.openUrl(resumeUrl);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.15,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppColors.outlinedButtonColor),
                              ),
                              child: Text(
                                'My Resume',
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
