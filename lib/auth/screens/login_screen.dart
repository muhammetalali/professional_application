import 'package:flutter/material.dart';
import 'package:professional_application/auth/components/body_auth_component.dart';
import 'package:professional_application/components/button_component.dart';
import 'package:professional_application/components/text_primary_component.dart';
import 'package:professional_application/components/text_secondary_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyAuthComponent(
      body: Column(
        children: [
          const TextPrimaryComponent(text: "ddd"),
          const TextSecondaryComponent(
            text: "يرجى إدخال بريدك الإلكتروني لنرسل لك رمز تحقق لمرة واحدة",
          ),
          ButtonComponent(text: "تسجيل الدخول", onPressed: () {}),
        ],
      ),
    );
  }
}
