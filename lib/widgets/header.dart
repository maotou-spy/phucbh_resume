// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:phucbh_resume/constants/colors.dart';
import 'package:phucbh_resume/constants/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants/nav_items.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Màn hình lớn (desktop hoặc tablet lớn)
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 20),
            color: AppColors.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                GradientText(
                  ' maotou ',
                  style: AppTextStyle.heading.copyWith(
                    fontFamily: GoogleFonts.satisfy().fontFamily,
                    fontStyle: FontStyle.italic,
                    color: AppColors.lightTextColor,
                  ),
                  colors: AppColors.buttonGradient.colors,
                  stops: const [0.3, 0.7],
                ),

                const Spacer(),
                for (int i = 0; i < navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        onNavMenuTap(i);
                      },
                      child: Text(
                        navTitles[i],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          // Smartphone or small tablet
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: AppColors.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                children: [
                  GradientText(
                    ' maotou ',
                    style: AppTextStyle.subtitle.copyWith(
                      fontFamily: GoogleFonts.satisfy().fontFamily,
                      fontStyle: FontStyle.italic,
                    ),
                    colors: AppColors.buttonGradient.colors,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
