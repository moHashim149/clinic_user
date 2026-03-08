part of 'home_widgets_imports.dart';

class BaseBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? bottomAction;

  const BaseBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.bottomAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.headline,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: AppColors.blackColor),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Flexible(child: child),
          if (bottomAction != null) ...[
            SizedBox(height: 24.h),
            bottomAction!,
            SizedBox(height: 16.h),
          ],
        ],
      ),
    );
  }
}

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  final List<String> sortOptions = const [
    "العروض فقط",
    "السعر الاقل الي الاعلى",
    "السعر الاعلى الي الاقل",
    "الأقرب لموقعك",
    "الاعلي تقييم",
    "الاحدث",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectionCubit("العروض فقط"),
      child: BlocBuilder<SelectionCubit, String>(
        builder: (context, selectedSort) {
          return BaseBottomSheet(
            title: "ترتيب",
            bottomAction: CustomButton(
              text: "تم",
              onPressed: () => Navigator.pop(context, selectedSort),
              backgroundColor: AppColors.primary,
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(30.r),
              height: 56.h,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sortOptions.length,
              itemBuilder: (context, index) {
                final option = sortOptions[index];
                final isActive = selectedSort == option;
                return RadioListTile<String>(
                  value: option,
                  groupValue: selectedSort,
                  onChanged: (val) {
                    context.read<SelectionCubit>().selectOption(val!);
                  },
                  title: Text(
                    option,
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors.primary;
                    }
                    return AppColors.stroke;
                  }),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: "فرز حسب",
      bottomAction: CustomButton(
        text: "عرض النتائج",
        onPressed: () => Navigator.pop(context),
        backgroundColor: AppColors.primary,
        borderRadius: BorderRadius.circular(30.r),
        height: 60.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSelectionItem(
              context,
              label: "القسم الرئيسي",
              onTap: () => _showSelectionSheet(context, "القسم الرئيسي"),
            ),
            _buildSelectionItem(
              context,
              label: "القسم الفرعي",
              onTap: () {},
            ),
            _buildSelectionItem(
              context,
              label: "الخدمة",
              onTap: () {},
            ),
            _buildSelectionItem(
              context,
              label: "عدد الجلسات",
              onTap: () {},
            ),
            _buildSelectionItem(
              context,
              label: "الجهاز المستخدم",
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "سعر العرض",
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildPriceInput("من"),
                    SizedBox(width: 16.w),
                    _buildPriceInput("الي"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionItem(BuildContext context, {required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.inputWhiteColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.stroke),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.grayColor),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInput(String label) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.textStyle12.copyWith(color: AppColors.blackColor,fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 80.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.grayTwelfthColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: const Center(
            child: Text(
              "--",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  void _showSelectionSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SelectionBottomSheet(title: title),
    );
  }
}

class SelectionBottomSheet extends StatelessWidget {
  final String title;
  const SelectionBottomSheet({super.key, required this.title});

  final List<String> options = const [
    "ليزر وتجميل",
    "اسنان",
    "فيلر",
    "بوتوكس",
    "زراعة الشعر",
    "شد الوجه",
    "تقشير كيميائي",
    "تجميل الأنف",
    "بشرة",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectionCubit("ليزر وتجميل"),
      child: BlocBuilder<SelectionCubit, String>(
        builder: (context, selectedOption) {
          return BaseBottomSheet(
            title: title,
            bottomAction: CustomButton(
              text: "استمرار",
              onPressed: () => Navigator.pop(context, selectedOption),
              backgroundColor: AppColors.primary,
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(30.r),
              height: 56.h,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return RadioListTile<String>(
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (val) {
                    context.read<SelectionCubit>().selectOption(val!);
                  },
                  title: Text(
                    option,
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors.primary;
                    }
                    return AppColors.stroke;
                  }),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
