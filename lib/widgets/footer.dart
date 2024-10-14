import 'package:flutter/material.dart';
import 'package:phucbh_resume/constants/styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Made by Maotou with ",
            style: AppTextStyle.body,
          ),
          const Icon(
            Icons.favorite,
            size: 15,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
