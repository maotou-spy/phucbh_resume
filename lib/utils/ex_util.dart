import 'package:phucbh_resume/utils/asset_helper.dart';

class ExUtils {
  final String image;
  final String title;
  final String? companyDescription;
  final String time;
  final String description;
  final String? techUsed;
  final String? role;
  final String? video;

  ExUtils({
    required this.image,
    required this.title,
    this.companyDescription,
    required this.time,
    required this.description,
    this.techUsed,
    this.role,
    this.video,
  });
}

// ###############
// EXPERIENCE PROJECTS
List<ExUtils> workExUtils = [
  ExUtils(
    image: AssetHelper.s4btImage,
    title: 'S4BT Solutions for Business Travel.',
    companyDescription: 'European company simplifying business travel booking and payments.',
    time: '2026 - Present',
    description: 'QA automation for booking workflows, manual/API testing, and automation with Playwright & Selenium.',
    techUsed: 'Teams size: 15, Selenium (C#), Playwright (TypeScript), Azure DevOps, Git',
    role: 'QA Automation Engineer',
  ),
  ExUtils(
    image: AssetHelper.tsbImage,
    title: 'Total Soft Bank Ltd.',
    companyDescription: 'Global leader in maritime and logistics software.',
    time: '2025 - 2026',
    description: 'Analyzed requirements, coordinated QA testing, and validated API integrations with ERP systems.',
    role: 'Software QA Engineer',
    techUsed: 'Team size: 5'
  ),
  ExUtils(
    image: AssetHelper.fptSoftwareImage,
    title: 'FPT Software Co., Ltd.',
    time: '2023',
    description: 'Developed backend services and RESTful APIs for recruitment site using Spring Boot.',
    techUsed: 'Team size: 10, Java, Spring Boot, Git, Google Docs',
    role: 'Java Developer Intern',
  ),
];

// ###############
// PERSONAL PROJECTS
List<ExUtils> personalExUtils = [
  ExUtils(
    image: AssetHelper.baiImage,
    title: 'Bai - Bike Parking App for FPTU',
    time: '2024',
    description: 'Cashless parking management app with in-app payments, statistics, and user roles.',
    techUsed: 'Electron, ASP.NET, Flutter, VNPAY, ZaloPay, GitHub, Google Workspace',
    role: 'Backend & Mobile Developer',
  ),
  ExUtils(
    image: AssetHelper.lumosImage,
    title: 'Lumos - Mothers\' Home Healthcare Platform',
    time: '2024',
    description: 'Platform connecting mothers & infants to home medical services with easy appointment scheduling.',
    techUsed: 'Next.js, ASP.NET, Flutter, payOS, Git, Trello, Google Workspace',
    role: 'Backend & Mobile Developer',
    video: 'https://youtu.be/sdqDnwKHtEE',
  ),
];
