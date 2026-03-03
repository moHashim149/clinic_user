part of 'create_account_imports.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final ValueNotifier<bool> _acceptTermsNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<String?> _selectedCityNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<List<String>> _selectedInterestsNotifier = ValueNotifier<List<String>>([]);
  final ValueNotifier<bool> _isInterestsExpandedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<String> _otherInterestNotifier = ValueNotifier<String>("");
  final TextEditingController _otherInterestController = TextEditingController();

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
               CreateAccountHeader(),
              heightSpace(40.h),
               CreateAccountProfileImage(),
              heightSpace(40.h),
              CreateAccountForm(
                selectedCityNotifier: _selectedCityNotifier,
                selectedInterestsNotifier: _selectedInterestsNotifier,
                isInterestsExpandedNotifier: _isInterestsExpandedNotifier,
                otherInterestNotifier: _otherInterestNotifier,
                otherInterestController: _otherInterestController,
              ),
              heightSpace(24.h),
              CreateAccountTerms(
                acceptTermsNotifier: _acceptTermsNotifier,
              ),
              heightSpace(40.h),
              CreateAccountButton(
                onPressed: () {
                  if (_acceptTermsNotifier.value) {
                    // TODO: Implement registration logic
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

  @override
  void dispose() {
    _acceptTermsNotifier.dispose();
    _selectedCityNotifier.dispose();
    _selectedInterestsNotifier.dispose();
    _isInterestsExpandedNotifier.dispose();
    _otherInterestNotifier.dispose();
    _otherInterestController.dispose();
    super.dispose();
  }
}
