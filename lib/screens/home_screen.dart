// ignore_for_file: deprecated_member_use
import 'package:professional_application/screens/settings_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:professional_application/components/card_user_data_component.dart';
import 'package:professional_application/providers/home_provider.dart';
import 'package:professional_application/providers/requests_provider.dart';
import 'package:professional_application/screens/requests_screen.dart';
import 'package:professional_application/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provHome = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
        child: Consumer<HomeProvider>(
          builder: (context, prov, child) {
            return Column(
              children: [
                const CardUserDataComponent(
                  userName: "محمد العلي ",
                  userImage: "assets/images/image_card.png",
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _buildCurrentScreen(prov.currentScreenIndex, context),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: _buildConvexBottomBar(context, provHome),
    );
  }

  Widget _buildConvexBottomBar(BuildContext context, HomeProvider provHome) {
    final requestsProvider = Provider.of<RequestsProvider>(context);

    return ConvexAppBar(
      style: TabStyle.react,
      backgroundColor: Colors.white,
      color: Colors.black54,
      activeColor: AppColors.primary,
      items: [
        TabItem(
          icon: SvgPicture.asset(
            "assets/svg/home.svg",
            color: provHome.currentScreenIndex == 0
                ? AppColors.primary
                : Colors.black54,
          ),
          title: 'الرئيسية',
          activeIcon: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  "assets/svg/home-Clr.svg",
                  color: AppColors.primary,
                ),
              ),
              if (provHome.currentScreenIndex == 0)
                const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                ),
            ],
          ),
        ),
        TabItem(
          icon: SvgPicture.asset(
            "assets/svg/services-icon.svg",
            color: provHome.currentScreenIndex == 1
                ? AppColors.primary
                : Colors.black54,
          ),
          title: 'الخدمات',
          activeIcon: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  "assets/svg/services-icon-Clr.svg",
                  color: AppColors.primary,
                ),
              ),
              if (provHome.currentScreenIndex == 1)
                const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                ),
            ],
          ),
        ),
        TabItem(
          icon: Stack(
            children: [
              SvgPicture.asset(
                "assets/svg/requests.svg",
                color: provHome.currentScreenIndex == 2
                    ? AppColors.primary
                    : Colors.black54,
              ),
              if (requestsProvider.hasRequests)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      requestsProvider.requests.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          title: 'الطلبات',
          activeIcon: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  "assets/svg/requests-Clr.svg",
                  color: AppColors.primary,
                ),
              ),
              if (provHome.currentScreenIndex == 2)
                const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                ),
              if (requestsProvider.hasRequests)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      requestsProvider.requests.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        TabItem(
          icon: SvgPicture.asset(
            "assets/svg/setting.svg",
            color: provHome.currentScreenIndex == 3
                ? AppColors.primary
                : Colors.black54,
          ),
          title: 'الإعدادات',
          activeIcon: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  "assets/svg/setting-Clr.svg",
                  color: AppColors.primary,
                ),
              ),
              if (provHome.currentScreenIndex == 3)
                const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 4,
                  ),
                ),
            ],
          ),
        ),
      ],
      onTap: (int index) => provHome.changeScreen(index),
    );
  }

  Widget _buildCurrentScreen(int screenIndex, BuildContext context) {
    switch (screenIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildServicesContent();
      case 2:
        return const RequestsScreen();
      case 3:
        return const SettingsScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return const Center(
      child: Text(
        'محتويات الشاشة الرئيسية',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildServicesContent() {
    return const Center(
      child: Text(
        'محتويات شاشة الخدمات',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}