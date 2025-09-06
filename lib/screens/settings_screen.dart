// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:professional_application/screens/privacy_policy_screen.dart';
import 'package:professional_application/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // زر سياسة الخصوصية
            ListTile(
              leading: SvgPicture.asset(
                "assets/svg/shield-security.svg",
                width: 24,
                height: 24,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                'سياسة الخصوصية',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: SizedBox(
                width: 32,
                height: 32,
               
                child: Center(
                  child: Transform(
                    transform: Matrix4.rotationY(3.14),
                    child: const Icon(Icons.arrow_back, size: 22, color: Colors.grey),
                  ),
                ),
              ),
              onTap: () {
                
                Navigator.push(
                  
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}