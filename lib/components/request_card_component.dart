import 'package:flutter/material.dart';
import 'package:professional_application/theme/app_colors.dart';

class RequestCardComponent extends StatelessWidget {
  final String name;
  final String address;
  final String time;
  final String userImage;
  final String price;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RequestCardComponent({
    super.key,
    required this.name,
    required this.address,
    required this.time,
    required this.price,
    required this.onAccept,
    required this.onReject,
    this.userImage = "assets/images/persion.png",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87, // حواف متوسطة على كامل الكارد
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المستخدم والمعلومات في نفس السطر
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المستخدم
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(userImage),
              ),
              const SizedBox(width: 12),
              // المعلومات (الاسم، العنوان، الوقت)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم المستخدم والسعر في نفس السطر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(183, 210, 12, 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // العنوان مع الأيقونة
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color.fromARGB(255, 100, 97, 97),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            address,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // الوقت
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // أزرار القبول والرفض
          Row(
            children: [
              // زر رفض الطلب
              Expanded(
                child: ElevatedButton(
                  onPressed: onReject,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(
                      color: AppColors.primaryColor, 
                      width: 1,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'رفض الطلب',
                    style: TextStyle(
                      color:  AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // زر قبول الطلب
              Expanded(
                child: ElevatedButton(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(
                      color: Colors.black87, // إضافة الحواف السوداء الأنيقة
                      width: 1,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'قبول الطلب',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
