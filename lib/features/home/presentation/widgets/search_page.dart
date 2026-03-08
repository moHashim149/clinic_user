part of 'home_widgets_imports.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _queryNotifier = ValueNotifier<String>("");
  final ValueNotifier<bool> _showResultsNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _searchController.dispose();
    _queryNotifier.dispose();
    _showResultsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.indicatorInactive),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _queryNotifier,
                      builder: (context, query, _) {
                        return CustomTextFormField(
                          ctrl: _searchController,
                          hintText: "ابحث باسم مقدم الخدمة أو رقم العرض",
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          onChanged: (val) {
                            _queryNotifier.value = val;
                          },
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              AppAssets.search,
                              colorFilter: const ColorFilter.mode(
                                AppColors.grayColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          suffixIcon: query.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.close, color: AppColors.grayColor),
                                  onPressed: () {
                                    _searchController.clear();
                                    _queryNotifier.value = "";
                                  },
                                )
                              : null,
                          borderRadiusValue: 8.r,
                          fillColor: AppColors.whiteColor,
                          borderColor: AppColors.stroke,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: _buildFilterButton(
                      title: "فرز حسب",
                      icon: AppAssets.filterIcon,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const FilterBottomSheet(),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildFilterButton(
                      title: "ترتيب",
                      icon: AppAssets.sortVertical,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const SortBottomSheet(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 24.h),
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) => const SearchResultCard(),
                ),
              ),
              SizedBox(height: 16.h),
              CustomButton(
                height: 60.h,
                text: "بحث",
                onPressed: () {},
                backgroundColor: AppColors.primary,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(30.r),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.stroke),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                AppColors.grayColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: AppTextStyles.textStyle14.copyWith(
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.mostSellerImgTest),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8.r,
                right: 8.r,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    "رقم العرض: 45896",
                    style: AppTextStyles.textStyle8.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.r,
                right: 8.r,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppAssets.goldenStar),
                      SizedBox(width: 4.w),
                      Text(
                        "اربح 75 نقطة",
                        style: AppTextStyles.textStyle8.copyWith(
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _buildTag("ليزر"),
              SizedBox(width: 8.w),
              _buildTag("مناطق"),
              SizedBox(width: 8.w),
              _buildTag("هاف ليج"),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "8 جلسات ليزر",
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.textStyle10.copyWith(color: AppColors.grayColor,fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(text: "الجهاز : "),
                    TextSpan(
                      text: "كانديلا جنتل",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                "500.70",
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(AppAssets.currency, height: 16.h),
            ],
          ),


          SizedBox(height: 8.h),
          Text(
            "ليزر فل بدي بجهاز كانديلا بأحدث تقنيه.........",
            style: AppTextStyles.textStyle10.copyWith(color: AppColors.grayColor),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SvgPicture.asset(AppAssets.location, height: 16.h, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  "مجمع الرياض امام مسجد الفرج | حي السويدي",
                  style: AppTextStyles.textStyle10.copyWith(
                    color: AppColors.grayColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "احجز",
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(57.r),
                  height: 38.h,
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(34.r),
                ),
                child: SvgPicture.asset(AppAssets.heart,),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(34.r),
                ),
                child: SvgPicture.asset(AppAssets.shareIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.mintBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: AppTextStyles.textStyle10.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}