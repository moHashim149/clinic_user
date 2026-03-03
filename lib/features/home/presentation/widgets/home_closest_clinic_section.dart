part of 'home_widgets_imports.dart';

class HomeClosestClinicSection extends StatelessWidget {
  const HomeClosestClinicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الاقرب لك',
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.headline,
                ),
              ),
              Text(
                "عرض الكل",
                style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.headline,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 17.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 154.w,
                height: 195.h,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.stroke,
                    width: 1.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 114.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.closestClinicImgTest),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "بيوتي كلينك",
                          style: AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.starHome),
                            SizedBox(width: 4.w),
                            Text(
                              " 4.8 (500)",
                              style: AppTextStyles.textStyle8.copyWith(
                                color: AppColors.grayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.doubleLocation,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "2.5 كم",
                          style: AppTextStyles.textStyle10.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
