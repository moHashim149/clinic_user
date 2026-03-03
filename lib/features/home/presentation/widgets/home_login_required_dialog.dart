part of 'home_widgets_imports.dart';

class HomeLoginRequiredDialog extends StatelessWidget {
  const HomeLoginRequiredDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const HomeLoginRequiredDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.mintBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.loginReqImg,
              width: 140.w,
              height: 119.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),
            Text(
              "برجاء تسجيل الدخول أولا",
              style: AppTextStyles.textStyle18.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pushWithNamed(Routes.loginView),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      "تسجيل الدخول",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.stroke),
                      foregroundColor: AppColors.headline,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      "الغاء",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGray
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
