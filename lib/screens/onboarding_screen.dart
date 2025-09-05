// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:professional_application/screens/home_screen.dart';
import 'package:professional_application/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class OnboardingContent extends StatefulWidget {
  final List<String> images;
  final String title;
  final String description;
  final PageController pageController;
  final int currentPageIndex;
  final int totalPageCount;

  const OnboardingContent({
    super.key,
    required this.images,
    required this.title,
    required this.description,
    required this.pageController,
    required this.currentPageIndex,
    required this.totalPageCount,
  });

  @override
  _OnboardingContentState createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildImageCarousel()],
      ),
    );
  }

  Widget _buildImageCarousel() {
    final int prevIndex =
        (widget.currentPageIndex - 1 + widget.totalPageCount) %
        widget.totalPageCount;
    final int nextIndex = (widget.currentPageIndex + 1) % widget.totalPageCount;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: SizedBox(
          height: 380,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned(
                      left:
                          MediaQuery.of(context).size.width / 2 -
                          260 / 2 -
                          140 -
                          30,
                      top: 40,
                      child: Transform.scale(
                        scale: 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              widget.images[prevIndex],
                              height: 200,
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            widget.images[widget.currentPageIndex],
                            height: 1000,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      right:
                          MediaQuery.of(context).size.width / 2 -
                          260 / 2 -
                          140 -
                          30,
                      top: 40,
                      child: Transform.scale(
                        scale: 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              widget.images[nextIndex],
                              height: 200,
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "images": [
        "assets/images/real_estate1.jpg",
        "assets/images/real_estate2.jpg",
        "assets/images/real_estate3.jpg"
      ],
      "title": "مرحبًا بك في مهنيّ",
      "description": "منصتك للعثور على أفضل المهنيين في مختلف المجالات — النجارة , الحداد , الكهربائي",
    },
    {
      "images": [
        "assets/images/real_estate2.jpg",
        "assets/images/real_estate3.jpg",
        "assets/images/real_estate1.jpg"
      ],
      "title": "مهنيون في كل تخصص",
      "description": "اكتشف نخبة من الحرفيين والتقنيين الموثوقين، جاهزين لخدمتك أينما كنت",
    },
    {
      "images": [
        "assets/images/real_estate3.jpg",
        "assets/images/real_estate1.jpg",
        "assets/images/real_estate2.jpg"
      ],
      "title": "سهولة. أمان. جودة",
      "description": "احجز، تواصل، وقيّم بكل سلاسة — نحن نهتم بتجربتك من أول نقرة ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    images: List<String>.from(onboardingData[index]["images"]!),
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                    pageController: _pageController,
                    currentPageIndex: _currentPage,
                    totalPageCount: onboardingData.length,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildPageIndicator(),
            const SizedBox(height: 20),
            _buildNavigationButtons(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingData.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: _currentPage == index ? 20 : 10,
          decoration: BoxDecoration(
            color: _currentPage == index ? AppColors.primaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_currentPage == onboardingData.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
              _currentPage == onboardingData.length - 1 ? 'ابدا الان' : 'التالي',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10), 
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Text(
              'تخطي',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}