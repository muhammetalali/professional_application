import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:professional_application/locale/locale.dart';
import 'package:professional_application/locale/locale_controller.dart';
import 'package:professional_application/providers/home_provider.dart';
import 'package:professional_application/providers/requests_provider.dart';
import 'package:professional_application/screens/home_screen.dart';
import 'package:professional_application/screens/onboarding_screen.dart';
import 'package:professional_application/theme/app_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(MyLocaleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => RequestsProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Get.find<MyLocaleController>().initialLang,
        translations: MyLocale(),
        fallbackLocale: const Locale("ar"),
        title: 'تطبيق مهني',
        
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        
        theme: ThemeData(
          fontFamily: "font",
          scaffoldBackgroundColor: AppColors.backgroundColor,
          primaryColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
          ),
        ),
        
        home: const OnboardingScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}