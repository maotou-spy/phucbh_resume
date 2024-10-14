import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/constants/styles.dart';
import 'package:phucbh_resume/widgets/about_mobile_section.dart';
import '../widgets/about_desktop_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/home_mobile_section.dart';
import '../widgets/home_desktop_section.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: Header(
              onNavMenuTap: (int navIndex) {
                scrollToSection(navIndex);
              },
            ),
          ),
          endDrawer: constraints.maxWidth >= 800
              ? null
              : DrawerMobile(onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                }),
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Home
                    (screenWidth >= 800)
                        ? HomeSection(
                            key: navbarKeys.first,
                            onHireMeTap: () {
                              scrollToSection(3);
                            })
                        : MainMobile(
                            key: navbarKeys.first,
                            onHireMeTap: () {
                              scrollToSection(3);
                            }),

                    // About Me
                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      color: AppColors.backgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("About Me", style: AppTextStyle.heading),
                          const SizedBox(height: 50),
                          (constraints.maxWidth >= 800)
                              ? const AboutDesktop()
                              : const AboutMobile(),
                        ],
                      ),
                    ),

                    // Experience
                    ExperienceSection(
                      key: navbarKeys[2],
                    ),
                    const SizedBox(height: 30),

                    // Contact
                    ContactForm(key: navbarKeys[3]),
                    const SizedBox(height: 30),

                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
