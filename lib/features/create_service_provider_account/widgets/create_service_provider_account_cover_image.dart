part of 'create_service_provider_account_widgets_imports.dart';

class CreateServiceProviderAccountCoverImage extends StatelessWidget {
  final ValueListenable<File?> coverImageNotifier;
  final VoidCallback onPickCoverImage;

  const CreateServiceProviderAccountCoverImage({
    super.key,
    required this.coverImageNotifier,
    required this.onPickCoverImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "صوره الغلاف ( اختياري)",
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
        ),
        heightSpace(8.h),
        ValueListenableBuilder<File?>(
          valueListenable: coverImageNotifier,
          builder: (context, file, _) {
            return InkWell(
              onTap: onPickCoverImage,
              child: Container(
                height: 154.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.inputWhiteColor,
                  border: Border.all(color: AppColors.stroke),
                  borderRadius: BorderRadius.circular(16.r),
                  image: file != null
                      ? DecorationImage(
                          image: FileImage(file),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: file == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AppAssets.addIcon,
                              height: 15,
                              width: 15,
                            ),
                          ),
                          heightSpace(8.h),
                          Text(
                            "اضغط لاختيار صوره",
                            style: AppTextStyles.textStyle12.copyWith(
                              color: AppColors.hintColor,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            );
          },
        ),
      ],
    );
  }
}
