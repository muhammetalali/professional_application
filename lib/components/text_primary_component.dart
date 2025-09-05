import 'package:flutter/material.dart';
import 'package:professional_application/theme/app_colors.dart';

class TextPrimaryComponent extends StatelessWidget {
  const TextPrimaryComponent({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}