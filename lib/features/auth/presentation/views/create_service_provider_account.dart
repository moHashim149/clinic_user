part of 'create_service_provider_account_imports.dart';

class CreateServiceProviderAccount extends StatefulWidget {
  const CreateServiceProviderAccount({super.key});

  @override
  State<CreateServiceProviderAccount> createState() => _CreateServiceProviderAccountState();
}

class _CreateServiceProviderAccountState extends State<CreateServiceProviderAccount> {
  final ValueNotifier<bool> _acceptTermsNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<String?> _selectedCityNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<List<String>> _selectedCategoriesNotifier = ValueNotifier<List<String>>([]);
  final ValueNotifier<bool> _isCategoriesExpandedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _passwordObscureNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _confirmPasswordObscureNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<File?> _coverImageNotifier = ValueNotifier<File?>(null);
  final PhoneFieldController _phoneController = PhoneFieldController();
  final DocumentHelper _documentHelper = getIt<DocumentHelper>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateServiceProviderAccountHeader(),
              heightSpace(40.h),
              const CreateServiceProviderAccountProfileImage(),
              heightSpace(40.h),
              CreateServiceProviderAccountCoverImage(
                coverImageNotifier: _coverImageNotifier,
                onPickCoverImage: _pickCoverImage,
              ),
              heightSpace(24.h),
              CreateServiceProviderAccountForm(
                selectedCityNotifier: _selectedCityNotifier,
                selectedCategoriesNotifier: _selectedCategoriesNotifier,
                isCategoriesExpandedNotifier: _isCategoriesExpandedNotifier,
                phoneController: _phoneController,
                passwordObscureNotifier: _passwordObscureNotifier,
                confirmPasswordObscureNotifier: _confirmPasswordObscureNotifier,
              ),
              heightSpace(24.h),
              _buildTermsSection(),
              heightSpace(40.h),
              CustomButton(
                text: "انشاء حساب",
                height: 56,
                borderRadius: BorderRadius.circular(30),
                backgroundColor: AppColors.primary,
                onPressed: () {
                   if (_acceptTermsNotifier.value) {
                    Navigator.pushNamed(
                      context,
                      Routes.verifyEmailView,
                      arguments: VerifyEmailArgument(email: "clinic11@gmail.com"),
                    );
                  }
                },
              ),
               heightSpace(30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsSection() {
    return ValueListenableBuilder<bool>(
      valueListenable: _acceptTermsNotifier,
      builder: (context, acceptTerms, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: Checkbox(
                value: acceptTerms,
                onChanged: (val) => _acceptTermsNotifier.value = val ?? false,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                side: const BorderSide(color: AppColors.stroke),
              ),
            ),
            widthSpace(10.w),
            Text.rich(
              TextSpan(
                text: "بإنشاء حسابك، فإنك توافق على  ",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextSecondaryColor,
                ),
                children: [
                  TextSpan(
                    text: "الشروط والأحكام",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _acceptTermsNotifier.dispose();
    _selectedCityNotifier.dispose();
    _selectedCategoriesNotifier.dispose();
    _isCategoriesExpandedNotifier.dispose();
    _passwordObscureNotifier.dispose();
    _confirmPasswordObscureNotifier.dispose();
    _coverImageNotifier.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickCoverImage() async {
    final file = await _documentHelper.pickImage(type: PickImageFromEnum.gallery);
    if (file != null) {
      _coverImageNotifier.value = file;
    }
  }
}
