part of 'home_widgets_imports.dart';

class HomeBannerSlider extends StatelessWidget {
  const HomeBannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480.h,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Image.asset(
                AppAssets.homeBanner,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
          Positioned(
            bottom: 24.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  width: index == 0 ? 16.w : 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: index == 0 ? AppColors.primary : AppColors.whiteColor,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
