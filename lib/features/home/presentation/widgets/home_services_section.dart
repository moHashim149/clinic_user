part of 'home_widgets_imports.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {"icon": AppAssets.women, "title": "ليزر"},
      {"icon": AppAssets.men, "title": "تجميل"},
      {"icon": AppAssets.child, "title": "البشرة"},
      {"icon": AppAssets.orders, "title": "اسنان"},
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تسوق خدماتنا",
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
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            reverse: true,
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.locationIcon), // Placeholder image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      services[index]["title"]!,
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        fontFamily: 'Cairo',
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
