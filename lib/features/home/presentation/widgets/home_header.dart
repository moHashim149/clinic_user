part of 'home_widgets_imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(40.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const AssetImage(AppAssets.profile),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    "مرحباً Sarah Hytham",
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildIconContainer(
                AppAssets.locationIcon,
              ), // Notification bell placeholder
              SizedBox(width: 8.w),
              _buildIconContainer(AppAssets.search),
              SizedBox(width: 8.w),
              _buildIconContainer(AppAssets.notification),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(String asset) {
    return Container(
      width: 44.w,
      height: 44.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: asset.endsWith('.svg')
          ? SvgPicture.asset(
              asset,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            )
          : Image.asset(asset, color: AppColors.primary),
    );
  }
}
