// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyRequestsComponent extends StatelessWidget {
  final Color iconColor;

  final String svgAsset;

  const EmptyRequestsComponent({
    super.key,
    this.iconColor = const Color(0xFFB0B0B0), 
    this.svgAsset = "assets/svg/audit1.svg", 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          SvgPicture.asset(
            svgAsset,
            height: 80,
            width: 80,
            color: iconColor,
          ),

          const SizedBox(height: 24),

          const Text(
            "لا توجد طلبات حالياً",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "لم يتم استلام أي طلبات جديدة في الوقت الحالي، يرجى التحقق لاحقاً لمتابعة الطلبات القادمة والعمل عليها.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
