part of 'create_account_widgets_imports.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "أنشئ حسابك",
          style: AppTextStyles.textStyle20.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
