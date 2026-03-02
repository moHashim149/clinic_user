part of 'create_account_widgets_imports.dart';

class CreateAccountProfileImage extends StatelessWidget {
  const CreateAccountProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140.r,
            height: 140.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.stroke,
                width: 1,
              ),
              color: AppColors.inputWhiteColor,
            ),
            child: Transform.scale(
              scale: 0.6,
                child: Image.asset(AppAssets.profile),
            ),
          ),
          Positioned(
            bottom: 5.r,
            right: 5.r,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 1),
              ),
              child: Image.asset(
                AppAssets.editPin,
                width: 20.r,
                height: 20.r,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
