import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CustomReservationsTabWidget extends StatelessWidget {
  final bool isCurrentSelected;
  final VoidCallback onCurrentTap;
  final VoidCallback onPreviousTap;
  final String currentText;
  final String previousText;

  const CustomReservationsTabWidget({
    super.key,
    required this.isCurrentSelected,
    required this.onCurrentTap,
    required this.onPreviousTap,
    required this.currentText,
    required this.previousText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.all(4.r),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onCurrentTap,
              child: Container(
                decoration: BoxDecoration(
                  color: isCurrentSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: isCurrentSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  currentText,
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isCurrentSelected
                        ? AppColors.primaryColor
                        : AppColors.blackTextEighthColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onPreviousTap,
              child: Container(
                decoration: BoxDecoration(
                  color: !isCurrentSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: !isCurrentSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  previousText,
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: !isCurrentSelected
                        ? AppColors.primaryColor
                        : AppColors.blackTextEighthColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
