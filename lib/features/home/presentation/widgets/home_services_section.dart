part of 'home_widgets_imports.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {"icon": AppAssets.servTestImg, "title": "ليزر"},
      {"icon": AppAssets.servTestImg, "title": "تجميل"},
      {"icon": AppAssets.servTestImg, "title": "البشرة"},
      {"icon": AppAssets.servTestImg, "title": "اسنان"},
      {"icon": AppAssets.servTestImg, "title": "البشرة"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تسوق خدماتنا",
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.headline,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () => HomeLoginRequiredDialog.show(context),
                child: Text(
                  "عرض الكل",
                  style: AppTextStyles.textStyle10.copyWith(
                    color: AppColors.headline,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160.h,
          child: ListView.builder(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 17.w),
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.stroke.withValues(alpha: 0.5),
                        width: 1.w,
                      ),
                      image: DecorationImage(
                        image: AssetImage(services[index]["icon"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    services[index]["title"]!,
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
