import 'package:phucbh_resume/utils/asset_helper.dart';

class ExUtils {
  final String image;
  final String title;
  final String time;
  final int teamSize;
  final String description;
  final String? techUsed;
  final String? managementTools;
  final String? role;
  final String? video;

  ExUtils({
    required this.image,
    required this.title,
    required this.time,
    required this.teamSize,
    required this.description,
    this.techUsed,
    this.managementTools,
    this.role,
    this.video,
  });
}

// ###############
// PERSONAL PROJECTS
List<ExUtils> workExUtils = [
  ExUtils(
    image: AssetHelper.fptSoftwareImage,
    title: 'FPT Software Co., Ltd (HCM)',
    time: 'May 2023 - Sep 2023',
    teamSize: 12,
    description:
        'Contributed to the development of a recruitment website for FPT Software, utilizing Spring Boot, collaborating with the team, and gaining enterprise-level experience.',
    techUsed: 'Java, Spring Boot',
    managementTools: 'GitHub, Google Docs',
    role: 'Java Developer Intern',
  ),
];

// ###############
// WORK PROJECTS
List<ExUtils> personalExUtils = [
  ExUtils(
    image: AssetHelper.baiImage,
    title: 'Bai - No Cash Payment Bike Parking Application for FPTU Campus',
    time: 'Apr 2024 - Sep 2024',
    teamSize: 4,
    description:
        'The Bai Parking app efficiently manages parking at FPT University HCM, featuring parking management, in-app purchases, statistics, and user classification.',
    techUsed: 'Electron, ASP.NET, Entity Framework, Flutter, VNPAY, ZaloPay',
    managementTools: 'GitHub, Google Workspace',
    role: 'Backend developer, Mobile developer',
  ),
  ExUtils(
    image: AssetHelper.lumosImage,
    title: 'Lumos - A Mothers\' Home Healthcare Platform',
    time: 'Jan 2024 - Apr 2024',
    teamSize: 4,
    description:
        'A platform connecting expectant and new mothers, along with infants, to home medical services, allowing easy appointment scheduling with trusted providers.',
    techUsed: 'Next.js, ASP.NET - Entity Framework,  Flutter, payOS',
    managementTools: 'GitHub, Trello, Google Workspace',
    role: 'Backend developer, Mobile developer',
    video: 'https://youtu.be/sdqDnwKHtEE',
  ),
];
