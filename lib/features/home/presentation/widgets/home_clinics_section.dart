part of 'home_widgets_imports.dart';

class HomeClinicsSection extends StatelessWidget {
  final String title;
  const HomeClinicsSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.textStyle18w700.copyWith(
                  color: AppColors.headline,
                  fontFamily: 'Cairo',
                ),
              ),
              Text(
                "عرض الكل",
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.headline,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            reverse: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 150.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.indicatorInactive),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              AppAssets.locationIcon,
                            ), // Placeholder
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "بيوتي كلينك",
                              style: AppTextStyles.textStyle12.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 12.r,
                                      color: AppColors.primary,
                                    ),
                                    Text(
                                      "2.5 كم",
                                      style: AppTextStyles.textStyle8.copyWith(
                                        color: AppColors.grayColor,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4.8 (500)",
                                      style: AppTextStyles.textStyle8.copyWith(
                                        color: AppColors.grayColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12.r,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
