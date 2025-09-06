import 'package:flutter/material.dart';
import 'package:professional_application/theme/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'سياسة الخصوصية',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blackColor.withOpacity(0.4), // دائرة شفافة
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'نحن في منصة المهنين نحترم خصوصية جميع المستخدمين ونسعى لحماية بياناتهم الشخصية. عند تسجيلك في التطبيق أو استخدامك لخدماتنا، قد نقوم بجمع بعض المعلومات مثل اسمك ورقم هاتفك وبريدك الإلكتروني وموقعك الجغرافي، إضافةً إلى أي صور أو فيديوهات تقوم برفعها لعرض أعمالك، وكذلك بيانات الاستخدام الخاصة بجهازك ونشاطك داخل التطبيق. نستخدم هذه المعلومات لتمكينك من إنشاء حساب وإدارة ملفك الشخصي وعرض خدماتك للعملاء وتسهيل التواصل ومعالجة الطلبات والحجوزات وإرسال الإشعارات المهمة وتحسين تجربة الاستخدام',
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
