part of 'home_widgets_imports.dart';

class HomeAdsImgSection extends StatelessWidget {
  const HomeAdsImgSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          _buildAdImage(AppAssets.homeImgTest),
          SizedBox(height: 16.h),
          _buildAdImage(AppAssets.homeImgTest),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(child: _buildAdImage(AppAssets.homeImgTest, height: 160.h)),
              SizedBox(width: 12.w),
              Expanded(child: _buildAdImage(AppAssets.homeImgTest, height: 160.h)),
            ],
          ),
          SizedBox(height: 16.h),
          _buildAdImage(AppAssets.homeImgTest),
        ],
      ),
    );
  }

  Widget _buildAdImage(String imagePath, {double? height}) {
    return Container(
      width: double.infinity,
      height: height ?? 175.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}