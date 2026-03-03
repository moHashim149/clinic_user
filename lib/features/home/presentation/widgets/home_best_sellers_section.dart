part of 'home_widgets_imports.dart';

class HomeBestSellersSection extends StatelessWidget {
  const HomeBestSellersSection({super.key});

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
                "الأكثر مبيعا",
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.headline,
                ),
              ),
              GestureDetector(
                onTap: () => HomeLoginRequiredDialog.show(context),
                child: Text(
                  "عرض الكل",
                  style: AppTextStyles.textStyle10.copyWith(
                    color: AppColors.headline,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 310.h,
          child: ListView.builder(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 17.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 170,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.stroke),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 130.h,
                          width: 154,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.mostSellerImgTest),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Text(
                              "رقم العرض: 45896",
                              style: AppTextStyles.textStyle8.copyWith(
                                color: AppColors.headline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "500.70",
                              style: AppTextStyles.textStyle18w700.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(AppAssets.currency)
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.starHome,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "4.8 (500)",
                              style: AppTextStyles.textStyle8.copyWith(
                                color: AppColors.grayColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          "8 جلسات ليزر",
                          style: AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "ليزر فل بدي بجهاز كانديلا بأحدث تقنية.........",
                      style: AppTextStyles.textStyle10.copyWith(
                        color: AppColors.grayColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          AppAssets.location,
                          height: 16.h,
                          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                        ),
                        Expanded(
                          child: Text(
                            "مجمع الرياض ... | حي السويدي",
                            style: AppTextStyles.textStyle10.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
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