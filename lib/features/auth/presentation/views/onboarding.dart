import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/features/home/presentation/views/home_page_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/util/routing/routes.dart';
import '../widgets/onboarding_widgets/widgets_imports.dart';
import 'log_in_view.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _onNextPressed() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushWithNamed(Routes.signInView);
    }
  }

  final pages = <OnboardingPageData>[
    OnboardingPageData(
      title: 'جميع خدمات العناية الطبية بين يديك',
      description:
          'استعرض باقة متنوعة من خدمات الليزر والتجميل، الجلدية، وطب الأسنان من مقدمي خدمات معتمدين، بكل سهولة .',
      imagePath: 'assets/images/onboarding_img1.png',
    ),
    OnboardingPageData(
      title: 'أفضل العروض الأقرب لك',
      description:
          'تصفح أفضل الأطباء، واطّلع على العروض الأكثر طلبًا والأقرب لموقعك، مع إمكانية حفظ عروضك المفضلة للرجوع لها لاحقًا.',
      imagePath: 'assets/images/onboarding_img2.png',
    ),
    OnboardingPageData(
      title: 'احجز موعدك بثقة وسهولة',
      description:
          'احجز العرض المناسب، حدّد االوقت المناسب لك ، وتابع حالة الحجز  مع إمكانية تقييم مقدم الخدمة بعد انتهاء الزيارة.',
      imagePath: 'assets/images/onboarding_img3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const OnboardingTopBar(),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        data: pages[index],
                        activeIndex: _currentIndex,
                      );
                    },
                  ),
                ),
                OnboardingFooterButtonsWidget(
                  onPressNext: () => _onNextPressed(),
                  onPressSkip: () =>
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>  SignInView()),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
