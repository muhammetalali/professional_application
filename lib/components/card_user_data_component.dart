import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:professional_application/theme/app_colors.dart';

class CardUserDataComponent extends StatelessWidget {
  final String userName;
  final String userImage;
  final VoidCallback? onNotificationPressed;

  const CardUserDataComponent({
    super.key,
    required this.userName,
    required this.userImage,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Info Section
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(userImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مرحبا...",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Notification Button
          InkWell(
            onTap: onNotificationPressed,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/notification.svg",
                  width: 24,
                  height: 24,
                  // ignore: deprecated_member_use
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}