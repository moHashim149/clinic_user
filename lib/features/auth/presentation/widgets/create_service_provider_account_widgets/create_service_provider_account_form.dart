part of 'create_service_provider_account_widgets_imports.dart';

class CreateServiceProviderAccountForm extends StatelessWidget {
  final ValueNotifier<String?> selectedCityNotifier;
  final ValueNotifier<List<String>> selectedCategoriesNotifier;
  final ValueNotifier<bool> isCategoriesExpandedNotifier;
  final PhoneFieldController phoneController;
  final ValueNotifier<bool> passwordObscureNotifier;
  final ValueNotifier<bool> confirmPasswordObscureNotifier;

  const CreateServiceProviderAccountForm({
    super.key,
    required this.selectedCityNotifier,
    required this.selectedCategoriesNotifier,
    required this.isCategoriesExpandedNotifier,
    required this.phoneController,
    required this.passwordObscureNotifier,
    required this.confirmPasswordObscureNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel("القسم الرئيسي"),
        ValueListenableBuilder<bool>(
          valueListenable: isCategoriesExpandedNotifier,
          builder: (context, isExpanded, _) {
            return Column(
              children: [
                InkWell(
                  onTap: () => isCategoriesExpandedNotifier.value = !isExpanded,
                  child: Container(
                    height: 56.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.inputWhiteColor,
                      border: Border.all(color: AppColors.stroke),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "اختر القسم",
                          style: AppTextStyles.textStyle14.copyWith(
                            color: AppColors.hintColor,
                          ),
                        ),
                        Icon(
                          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: isExpanded ? AppColors.primary : AppColors.inputTextColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                if (isExpanded) ...[
                  heightSpace(8.h),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.inputWhiteColor,
                      border: Border.all(color: AppColors.stroke),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ValueListenableBuilder<List<String>>(
                      valueListenable: selectedCategoriesNotifier,
                      builder: (context, selectedCategories, _) {
                        final categories = [
                          "اسنان",
                          "ليزر و تجميل",
                          "جلديه",
                        ];
                        return Column(
                          children: categories.map((category) {
                            final isSelected = selectedCategories.contains(category);
                            return InkWell(
                              onTap: () {
                                final current = List<String>.from(selectedCategories);
                                if (isSelected) {
                                  current.remove(category);
                                } else {
                                  current.add(category);
                                }
                                selectedCategoriesNotifier.value = current;
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     SizedBox(
                                      width: 24.w,
                                      height: 24.w,
                                      child: Checkbox(
                                        value: isSelected,
                                        onChanged: (_) {
                                          final current = List<String>.from(selectedCategories);
                                          if (isSelected) {
                                            current.remove(category);
                                          } else {
                                            current.add(category);
                                          }
                                          selectedCategoriesNotifier.value = current;
                                        },
                                        activeColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        side: const BorderSide(color: AppColors.stroke),
                                      ),
                                    ),
                                    Text(
                                      category,
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ],
            );
          },
        ),
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedCategoriesNotifier,
          builder: (context, selectedCategories, _) {
            if (selectedCategories.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                alignment: WrapAlignment.end,
                children: selectedCategories.map((category) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(31.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            final current = List<String>.from(selectedCategories);
                            current.remove(category);
                            selectedCategoriesNotifier.value = current;
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        ),
                        widthSpace(6.w),
                        Text(
                          category,
                          style: AppTextStyles.textStyle10.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
        heightSpace(20.h),
        _buildFieldLabel("اسم العياده"),
        CustomTextFormField(
          hintText: "ادخل اسم المستخدم",
          fillColor: AppColors.inputWhiteColor,
          borderColor: AppColors.stroke,
        ),
        heightSpace(20.h),
        _buildFieldLabel("رقم الجوال"),
        _buildPhoneField(),
        heightSpace(20.h),
        _buildFieldLabel("البريد الالكتروني"),
        CustomTextFormField(
          hintText: "ادخل البريد الالكتروني",
          fillColor: AppColors.inputWhiteColor,
          borderColor: AppColors.stroke,
        ),
        heightSpace(20.h),
        _buildFieldLabel("المدينه"),
        ValueListenableBuilder<String?>(
          valueListenable: selectedCityNotifier,
          builder: (context, selectedCity, _) {
            return CustomDropDownField<String>(
              hintText: "اختر المدينه",
              fillColor: AppColors.inputWhiteColor,
              borderColor: AppColors.stroke,
              items: const [
                DropdownMenuItem(value: "Riyadh", child: Text("الرياض")),
                DropdownMenuItem(value: "Jeddah", child: Text("جدة")),
              ],
              onChanged: (val) => selectedCityNotifier.value = val,
              value: selectedCity,
            );
          },
        ),
        heightSpace(20.h),
        _buildFieldLabel("الموقع الجغرافي"),
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            Routes.selectAddressView,
            arguments: SelectAddressArgument(
              addressModel: null,
              onUpdate: () {
                // TODO: handle location update when needed
              },
            ),
          ),
          child: CustomTextFormField(
            enabled: false,
            hintText: "ادخل العنوان بالتفصيل",
            fillColor: AppColors.inputWhiteColor,
            borderColor: AppColors.stroke,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //      SvgPicture.asset(AppAssets.locationIcon2),
              //      widthSpace(4.w),
              //     Text(
              //       "افتح الخريطه",
              //       style: AppTextStyles.textStyle12.copyWith(
              //         color: AppColors.primary,
              //       ),
              //     ),
              //   ],
              // ),
              child: Image.asset(AppAssets.openLocation,height: 30,width: 83,),
            ),
          ),
        ),
        heightSpace(20.h),
        _buildFieldLabel("رقم السجل التجاري"),
        CustomTextFormField(
          hintText: "ادخل رقم السجل التجاري",
          fillColor: AppColors.inputWhiteColor,
          borderColor: AppColors.stroke,
        ),
        heightSpace(20.h),
        _buildFieldLabel("كلمة المرور"),
        ValueListenableBuilder<bool>(
          valueListenable: passwordObscureNotifier,
          builder: (context, isObscure, _) {
            return CustomTextFormField(
              hintText: "*********",
              obscureText: isObscure,
              fillColor: AppColors.inputWhiteColor,
              borderColor: AppColors.stroke,
              suffixIcon: InkWell(
                onTap: () {
                  passwordObscureNotifier.value = !isObscure;
                },
                child: Icon(
                  isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ),
            );
          },
        ),
        heightSpace(20.h),
        _buildFieldLabel("تاكيد كلمة المرور"),
        ValueListenableBuilder<bool>(
          valueListenable: confirmPasswordObscureNotifier,
          builder: (context, isObscure, _) {
            return CustomTextFormField(
              hintText: "*********",
              obscureText: isObscure,
              fillColor: AppColors.inputWhiteColor,
              borderColor: AppColors.stroke,
              suffixIcon: InkWell(
                onTap: () {
                  confirmPasswordObscureNotifier.value = !isObscure;
                },
                child: Icon(
                  isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.inputWhiteColor,
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.saudi,
                    height: 18.h,
                    width: 24.w,
                  ),
                  widthSpace(6.w),
                  Text(
                    '+966',
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 30.h,
              color: AppColors.stroke,
            ),
            Expanded(
              child: TextFormField(
                controller: phoneController.controller,
                keyboardType: TextInputType.number,
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.blackColor,
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "05 *** ****",
                  hintStyle: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.hintColor,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          label,
          style: AppTextStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
