part of 'home_widgets_imports.dart';

class HomeBestSellersSection extends StatelessWidget {
  const HomeBestSellersSection({super.key});

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
                "الأكثر مبيعا",
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
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            reverse: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 200.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.indicatorInactive),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.locationIcon), // Placeholder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              "رقم العرض: 45896",
                              style: AppTextStyles.textStyle8.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "500.70 ريال",
                                style: AppTextStyles.textStyle14.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "4.8 (500)",
                                    style: AppTextStyles.textStyle8.copyWith(
                                      color: AppColors.grayColor,
                                    ),
                                  ),
                                  Icon(Icons.star, size: 12.r, color: Colors.amber),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "8 جلسات ليزر",
                            style: AppTextStyles.textStyle12.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          Text(
                            "ليزر فل بدي بجهاز كانديلا بأحدث تقنية ...",
                            style: AppTextStyles.textStyle10.copyWith(
                              color: AppColors.grayColor,
                              fontFamily: 'Cairo',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 12.r, color: AppColors.primary),
                                  Text(
                                    "حي السويدي",
                                    style: AppTextStyles.textStyle8.copyWith(
                                      color: AppColors.grayColor,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "مجمع الرياض الطبي",
                                style: AppTextStyles.textStyle8.copyWith(
                                  color: AppColors.grayColor,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ],
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
