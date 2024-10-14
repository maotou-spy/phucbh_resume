import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/contact_info.dart';
import 'package:phucbh_resume/utils/asset_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth * 0.9;
        maxWidth = maxWidth > 900 ? 900 : maxWidth;

        return SafeArea(
          child: Center(
            child: Container(
              width: maxWidth,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact me',
                    style: AppTextStyle.heading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  constraints.maxWidth > 800
                      ? _buildWideLayout(context)
                      : _buildNarrowLayout(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _buildForm(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 3,
          child: _buildContactInfo(),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildForm(context),
        const SizedBox(height: 40),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    final subjectController = TextEditingController();
    final messageController = TextEditingController();

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField('Subject', subjectController),
          const SizedBox(height: 20),
          _buildTextField('Message', messageController, maxLines: 5),
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () {
                var subject = subjectController.text;
                var message = messageController.text;

                launchUrl(Uri.parse(
                    'mailto:${ContactInfo.email}?subject=$subject&body=$message'));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width > 800 ? 200 : 150,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.outlinedButtonColor,
                  ),
                ),
                child: Text(
                  'Send Message',
                  style: AppTextStyle.subtitle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controler,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controler,
      maxLines: maxLines,
      keyboardType: TextInputType.text,
      style: AppTextStyle.body,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.white.withOpacity(0.9)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlinedButtonColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: const TextStyle(height: 0),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfoItem(Icons.home, ContactInfo.address),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.phone, ContactInfo.phoneNumber,
            type: ContactType.phone),
        const SizedBox(height: 20),
        _buildContactInfoItem(Icons.email, ContactInfo.email,
            type: ContactType.email),
        const SizedBox(height: 20),
        _buildContactInfoItem(null, ContactInfo.linkedinUrl,
            imagePath: AssetHelper.linkedinIcon, type: ContactType.web),
        const SizedBox(height: 20),
        _buildContactInfoItem(null, ContactInfo.githubUrl,
            imagePath: AssetHelper.githubIcon, type: ContactType.web),
      ],
    );
  }

  Widget _buildContactInfoItem(IconData? icon, String title,
      {String? imagePath, ContactType? type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon != null
            ? Icon(icon, color: AppColors.white)
            : Image.asset(imagePath!, width: 20),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              switch (type) {
                case ContactType.phone:
                  launchUrl(Uri.parse('tel:$title'));
                  break;
                case ContactType.email:
                  launchUrl(Uri.parse(
                      'mailto:$title?subject=Inquiry about...&body=Hello, I would like to know more about...'));
                  break;
                case ContactType.web:
                  launchUrl(Uri.parse(title));
                  break;
                default:
                  break;
              }
            },
            child: Text(title, style: AppTextStyle.body),
          ),
        ),
      ],
    );
  }
}

enum ContactType { phone, email, web }
