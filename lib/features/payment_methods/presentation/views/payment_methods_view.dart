import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/features/payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_payment_method_item_widget.dart';
import '../widgets/custom_payment_summary_widget.dart';
import 'payment_success_view.dart';

class PaymentMethodsView extends StatelessWidget {
  final PaymentMethodsArguments arguments;

  const PaymentMethodsView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              // Background Gradient
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: const [
                        Color(0x57C9C7D8),
                        Color(0xFFFFF4ED),
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                        Color(0xffffffff),
                      ],
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    // Custom App Bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "استكمال الحجز",
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                          ),
                          widthSpace(12.w),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              AppAssets.arrowForward, // Assuming arrow_forward for RTL back
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace(24.h),
                            // Discount Code Section
                            Text(
                              "إضافة كود خصم (اختياري)",
                              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                            ),
                            Text(
                              "استخدم كود خصم للحصول على المزيد من الخصم",
                              style: TextStyle(fontSize: 12.sp, color: AppColors.grayColor, fontFamily: 'Cairo'),
                            ),
                            heightSpace(12.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Color(0xfffafffe),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: AppColors.stroke),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "تطبيق",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        hintText: "اكتب كود الخصم",
                                        hintStyle: TextStyle(fontSize: 12.sp, fontFamily: 'Cairo'),
                                        border: InputBorder.none,
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(12.w),
                                          child: Icon(
                                            Icons.confirmation_num_outlined,
                                            color: AppColors.grayColor,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            heightSpace(24.h),
                            Divider(color: AppColors.stroke, thickness: 1.h),
                            heightSpace(24.h),

                            // Order Summary
                            CustomPaymentSummaryWidget(
                              totalOffers: arguments.total,
                              payNow: 15, // Mocked from Figma
                              payLater: arguments.total - 15, // Mocked logic
                            ),

                            heightSpace(24.h),
                            Divider(color: AppColors.stroke, thickness: 1.h),
                            heightSpace(24.h),

                            // Payment Method Selection
                            Text(
                              "وسيلة الدفع",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                color: AppColors.primaryColor,
                              ),
                            ),
                            heightSpace(16.h),
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: AppColors.stroke),
                              ),
                              child: Column(
                                children: [
                                  CustomPaymentMethodItemWidget(
                                    title: "إضافة بطاقة إئتمانية",
                                    logo: Row(
                                      children: [
                                        // Mocking card logos
                                        Icon(Icons.credit_card, size: 24.w, color: Colors.blue),
                                      ],
                                    ),
                                    isSelected: false,
                                    onTap: () {},
                                    trailing: Icon(Icons.add_circle_outline, color: AppColors.grayColor, size: 20.sp),
                                  ),
                                  CustomPaymentMethodItemWidget(
                                    title: "Apple Pay",
                                    logo: Icon(Icons.apple, size: 24.w),
                                    isSelected: true,
                                    onTap: () {},
                                  ),
                                  CustomPaymentMethodItemWidget(
                                    title: "تابي",
                                    logo: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                      decoration: BoxDecoration(
                                        color: Color(0xff00d084),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Text(
                                        "tabby",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                    isSelected: false,
                                    onTap: () {},
                                  ),
                                  CustomPaymentMethodItemWidget(
                                    title: "تمارا",
                                    logo: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                      decoration: BoxDecoration(
                                        color: Color(0xfffcd667),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Text(
                                        "tamara",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                    isSelected: false,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                            heightSpace(40.h),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Button
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
                      child: Container(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to payment success demo
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PaymentSuccessView()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                          ),
                          child: Text(
                            "إتمام الدفع",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
