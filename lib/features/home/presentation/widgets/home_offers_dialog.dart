part of 'home_widgets_imports.dart';

class HomeOffersDialog extends StatelessWidget {
  const HomeOffersDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const HomeOffersDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
    final List<String> offerImages = [
      AppAssets.offersImg,
      AppAssets.offersImg,
      AppAssets.offersImg,
    ];

    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 32,left: 32,top: 78,bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 388,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: PageView.builder(
                      itemCount: offerImages.length,
                      onPageChanged: (index) => currentPageNotifier.value = index,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          offerImages[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, activeIndex, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        offerImages.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: activeIndex == index ? 12.r : 8.r,
                          height: activeIndex == index ? 12.r : 8.r,
                          decoration: BoxDecoration(
                            color: activeIndex == index
                                ? AppColors.primary
                                : AppColors.secondaryWhite,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.stroke),
                ),
                child: Icon(
                  Icons.close,
                  size: 20.r,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
