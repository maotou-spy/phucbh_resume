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
      width: 350,
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
                colorBlendMode: BlendMode.srcATop,
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
            // role + time
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (project.role != null)
                    Text(project.role!,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        )),
                  // if (project.role != null)
                  //   Text('  ·  ',
                  //       style: AppTextStyle.caption.copyWith(
                  //         color: AppColors.white.withValues(alpha: 0.9),
                  //         // fontSize: 11,
                  //         fontStyle: FontStyle.italic,
                  //       )),
                  Text(project.time,
                      style: AppTextStyle.caption.copyWith(
                        color: AppColors.white.withValues(alpha: 0.6),
                        fontSize: 11,
                      )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(
                  color: AppColors.white.withValues(alpha: 0.1), height: 1),
            ),

            // company description
            if (project.companyDescription != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(project.companyDescription!,
                    style: AppTextStyle.caption.copyWith(
                      color: AppColors.white.withValues(alpha: 0.9),
                      // fontSize: 11,
                      fontStyle: FontStyle.italic,
                    )),
              ),

            const SizedBox(height: 10),

            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                project.description,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // technologies used
            if (project.techUsed != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.techUsed!
                      .split(',')
                      .map((t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(t.trim(),
                                style: AppTextStyle.caption.copyWith(
                                  color:
                                      AppColors.white.withValues(alpha: 0.85),
                                  fontSize: 10,
                                )),
                          ))
                      .toList(),
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
                  color: AppColors.white.withValues(alpha: 0.05),
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
