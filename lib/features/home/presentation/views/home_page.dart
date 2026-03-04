part of 'home_page_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _bottomNavIndexNotifier = ValueNotifier<int>(0);

  final List<String> _iconList = [
    AppAssets.home, // Placeholder for home/main
    AppAssets.cart,
    AppAssets.calender,
    AppAssets.more,
  ];

  @override
  void dispose() {
    _bottomNavIndexNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeOffersDialog.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _bottomNavIndexNotifier,
      builder: (context, activeIndex, _) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: _buildBody(activeIndex),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            child: SvgPicture.asset(
              AppAssets.chat2,
              height: 26.h,
              width: 28.w,
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: _iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? AppColors.primary : AppColors.grayColor;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    _iconList[index],
                    height: 24.h,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _getTabTitle(index),
                    style: AppTextStyles.textStyle10.copyWith(
                      color: color,
                      fontWeight: isActive
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              );
            },
            backgroundColor: AppColors.whiteColor,
            activeIndex: activeIndex,
            gapLocation: GapLocation.none,
            onTap: (index) => _bottomNavIndexNotifier.value = index,
            elevation: 8,
            shadow: Shadow(
              color: AppColors.blackColor.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    if (index == 1) {
      return CartView(cartArguments: CartArguments());
    } else if (index == 2) {
      return const ReservationsView();
    } else if (index != 0) {
      return MoreView();
    }
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            HomeBannerSlider(),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: HomeHeader(),
            ),
          ],
        ),
        HomeServicesSection(),          // Best clinics
        HomeClinicsSection(),
        HomeClosestClinicSection(),
        HomeBestSellersSection(),
        HomeAdsImgSection(),
      ],
    );
  }

  String _getTabTitle(int index) {
    switch (index) {
      case 0:
        return "الرئيسية";
      case 1:
        return "السلة";
      case 2:
        return "حجوزاتي";
      case 3:
        return "المزيد";
      default:
        return "";
    }
  }
}
