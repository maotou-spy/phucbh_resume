import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/constants/styles.dart';
import 'package:phucbh_resume/utils/asset_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/ex_util.dart';

class ExCardWidget extends StatelessWidget {
  const ExCardWidget({
    super.key,
    required this.project,
  });
  final ExUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // project img
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: AppColors.white,
              height: 200,
              child: Image.asset(
                project.image,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 4),
              child: Text(
                project.title,
                style: AppTextStyle.subtitle.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            // time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(project.time,
                  style: AppTextStyle.caption.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                  )),
            ),
            // role
            if (project.role != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(project.role!,
                    style: AppTextStyle.caption.copyWith(
                      color: AppColors.white.withOpacity(0.9),
                    )),
              ),

            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                project.description,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.white.withOpacity(0.9),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // team size
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('\u2022 Team size: ${project.teamSize}',
                  style: AppTextStyle.caption.copyWith(
                    color: AppColors.white.withOpacity(0.9),
                  )),
            ),

            // technologies used
            if (project.techUsed != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  '\u2022 Technologies: ${project.techUsed!}',
                  style: AppTextStyle.caption.copyWith(
                    color: AppColors.white.withOpacity(0.8),
                  ),
                ),
              ),

            const SizedBox(height: 10),

            // project video (if any)
            if (project.video != null)
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.05),
                ),
                child: TextButton(
                  onPressed: () async {
                    Uri uri = Uri.parse(project.video!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch ${project.video}';
                    }
                  },
                  child: Image.asset(
                    AssetHelper.youtubeIcon,
                    width: 18,
                    height: 18,
                    color: AppColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
