part of "create_account_widgets_imports.dart";

class CreateAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateAccountButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 56,
      onPressed: onPressed,
      text: "انشاء حساب",
      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.whiteColor),
      backgroundColor: AppColors.primary,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
