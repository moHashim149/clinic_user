part of 'create_account_widgets_imports.dart';

class CreateAccountForm extends StatelessWidget {
  final ValueNotifier<String?> selectedCityNotifier;
  final ValueNotifier<List<String>> selectedInterestsNotifier;
  final ValueNotifier<bool> isInterestsExpandedNotifier;
  final ValueNotifier<String> otherInterestNotifier;
  final TextEditingController otherInterestController;

  const CreateAccountForm({
    super.key,
    required this.selectedCityNotifier,
    required this.selectedInterestsNotifier,
    required this.isInterestsExpandedNotifier,
    required this.otherInterestNotifier,
    required this.otherInterestController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel("اسم المستخدم"),
        CustomTextFormField(
          hintText: "ادخل اسم المستخدم",
          fillColor: AppColors.inputWhiteColor,
          borderColor: AppColors.stroke,
        ),
        heightSpace(20.h),
        _buildFieldLabel("البريد الالكتروني (اختياري)"),
        CustomTextFormField(
          hintText: "ادخل البريد الالكتروني (اختياري)",
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
        _buildFieldLabel("الاهتمامات"),
        ValueListenableBuilder<bool>(
          valueListenable: isInterestsExpandedNotifier,
          builder: (context, isExpanded, _) {
            return Column(
              children: [
                InkWell(
                  onTap: () => isInterestsExpandedNotifier.value = !isExpanded,
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
                          "اختر الاهتمامات",
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
                    child: Column(
                      children: [
                        ValueListenableBuilder<List<String>>(
                          valueListenable: selectedInterestsNotifier,
                          builder: (context, selectedInterests, _) {
                            final interests = [
                              "ليزر وتجميل",
                              "اسنان",
                              "فيلر",
                              "بشرة",
                              "اخري",
                            ];
                            return Column(
                              children: interests.map((interest) {
                                final isSelected = selectedInterests.contains(interest);
                                return InkWell(
                                  onTap: () {
                                    final current = List<String>.from(selectedInterests);
                                    if (isSelected) {
                                      current.remove(interest);
                                    } else {
                                      current.add(interest);
                                    }
                                    selectedInterestsNotifier.value = current;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          interest,
                                          style: AppTextStyles.textStyle12.copyWith(
                                            color: AppColors.textPrimary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        widthSpace(12.w),
                                        SizedBox(
                                          width: 24.w,
                                          height: 24.w,
                                          child: Checkbox(
                                            value: isSelected,
                                            onChanged: (_) {
                                              final current = List<String>.from(selectedInterests);
                                              if (isSelected) {
                                                current.remove(interest);
                                              } else {
                                                current.add(interest);
                                              }
                                              selectedInterestsNotifier.value = current;
                                            },
                                            activeColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.r),
                                            ),
                                            side: const BorderSide(color: AppColors.stroke),
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
                        ValueListenableBuilder<List<String>>(
                          valueListenable: selectedInterestsNotifier,
                          builder: (context, selectedInterests, _) {
                            if (!selectedInterests.contains("اخري")) {
                              return const SizedBox.shrink();
                            }
                            return Column(
                              children: [
                                heightSpace(16.h),
                                CustomTextFormField(
                                  ctrl: otherInterestController,
                                  hintText: "ادخل اهتمامك",
                                  maxLines: 5,
                                  fillColor: AppColors.transparentColor,
                                  borderColor: AppColors.stroke,
                                  onChanged: (val) =>
                                      otherInterestNotifier.value = val ?? "",
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedInterestsNotifier,
          builder: (context, selectedInterests, _) {
            if (selectedInterests.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                alignment: WrapAlignment.end,
                children: selectedInterests.map((interest) {
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
                            final current = List<String>.from(selectedInterests);
                            current.remove(interest);
                            selectedInterestsNotifier.value = current;
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.r,
                            color: AppColors.primary,
                          ),
                        ),
                        widthSpace(6.w),
                        Text(
                          interest,
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
        _buildFieldLabel("كود المشاركة (اختياري)"),
        CustomTextFormField(
          hintText: "مثال : kdN23ww",
          fillColor: AppColors.inputWhiteColor,
          borderColor: AppColors.stroke,
        ),
      ],
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
