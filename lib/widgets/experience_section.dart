import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/colors.dart';

import '../utils/ex_util.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Job experience title

          const Text(
            "Job Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 50),
          // Work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workExUtils.length; i++)
                  ExCardWidget(
                    project: workExUtils[i],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // Personal experience title
          const Text(
            "Personal Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 50),
          // Hobby projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < personalExUtils.length; i++)
                  ExCardWidget(
                    project: personalExUtils[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
