import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/features/cart/data/arguments/cart_arguments.dart';
import 'package:brandy_user/features/cart/data/models/offer_cart_item_model.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_offer_cart_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../payment_methods/data/data_source/arguments/payment_methods_arguments.dart';

class CartView extends StatelessWidget {
  final CartArguments cartArguments;
  const CartView({super.key, required this.cartArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // Gradient Header Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 175.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffececec).withOpacity(0.4),
                    const Color(0xffecfffb),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top App Bar Area
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            LocaleKeys.cartTitle.tr(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "(${LocaleKeys.beautyClinic.tr()})",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              color: AppColors.grayColor,
                            ),
                          ),
                        ],
                      ),
                      widthSpace(10.w),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Builder(
                    builder: (context) {
                      final items = [
                        OfferCartItemModel(
                          id: 1,
                          offerNumber: "45896",
                          bookingDate: "02 يناير 2026 ، 09:00م",
                          district: "حي السويدي",
                          locationSubText: "مجمع الرياض امام مسجد الفرج",
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
                          price: 500.70,
                        ),
                        OfferCartItemModel(
                          id: 2,
                          offerNumber: "45897",
                          bookingDate: "05 يناير 2026 ، 10:30ص",
                          district: "حي المروج",
                          locationSubText: "برج المملكة، الدور الثالث",
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
                          price: 750.00,
                        ),
                      ];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 16.h,
                            ),
                            child: Text(
                              LocaleKeys.cartContent.tr(
                                namedArgs: {'count': items.length.toString()},
                              ),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              itemCount: items.length,
                              separatorBuilder: (context, index) =>
                                  heightSpace(25.h),
                              itemBuilder: (context, index) {
                                return CustomOfferCartItemWidget(
                                  offerCartItemModel: items[index],
                                  onDelete: () {
                                    // Static delete logic for UI only
                                  },
                                  onCompleteBooking: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.paymentMethodsView,
                                      arguments: PaymentMethodsArguments(
                                        locationId: 1, // Mock location ID
                                        total: items[index].price,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
