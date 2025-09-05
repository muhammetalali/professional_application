import 'package:flutter/material.dart';
import 'package:professional_application/theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const CustomIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: currentIndex == index ? 25 : 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentIndex == index
                ? AppColors.primaryColor
                : AppColors.inactiveColor,
          ),
        );
      }),
    );
  }
}