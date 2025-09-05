import 'package:flutter/material.dart';
import 'package:professional_application/theme/app_colors.dart';

class TextSecondaryComponent extends StatelessWidget {
  const TextSecondaryComponent({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blackSecondary,
      ),
    );
  }
}