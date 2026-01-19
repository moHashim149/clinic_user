import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../framework/spaces.dart';
import '../util/extensions/navigation.dart';
import 'custom_app_bar.dart';

class CustomBottomSheetPayWithMoyser extends StatelessWidget {
  final void Function() onPaidSuccess, onPaidFailed;
  final num price;
  final bool isIos;

  const CustomBottomSheetPayWithMoyser({
    super.key,
    required this.onPaidSuccess,
    required this.onPaidFailed,
    required this.price,
    required this.isIos,
  });

  @override
  Widget build(BuildContext context) {
    return isIos == true
        ? Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40.r),
                topEnd: Radius.circular(40.r),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                children: [
                  ApplePay(
                    config: PaymentConfig(
                      publishableApiKey: AppConstants.moyserApiKey,
                      amount: (price * 100).round(),
                      description: LocaleKeys.pay.tr(),
                      applePay: ApplePayConfig(
                        label: LocaleKeys.brandyApp.tr(),
                        merchantId: 'merchant.linkdevelopment.brandyUser',
                        manual: false, saveCard: false,
                      ),
                    ),
                    onPaymentResult: (result) {

                      debugPrint(result.toString());
                      if (result is PaymentResponse) {
                        debugPrint("----- $result");
                        debugPrint("----- ${result.status}");
                        if (result.status == PaymentStatus.paid) {
                          debugPrint(result.id.toString());
                          debugPrint(result.invoiceId.toString());
                          debugPrint(result.ip.toString());
                          debugPrint("----- paid");
                          // getTransactionId(transactionId: result.id.toString());
                          context.pop();
                          onPaidSuccess();
                        } else if (result.status == PaymentStatus.failed) {
                          debugPrint("----- $result");
                          debugPrint("----- ${result.status}");
                          debugPrint("Payment failed: ${result.source}");
                          final errorSource =
                              result.source as ApplePayPaymentResponseSource;
                          debugPrint("Payment failed: ${errorSource.type}");
                          debugPrint("Payment failed: ${errorSource.message}");
                          debugPrint(
                              "Payment failed code: ${errorSource.number}");
                          debugPrint(
                              "Payment failed code: ${errorSource.gatewayId}");
                          debugPrint(
                              "Payment failed code: ${errorSource.referenceNumber}");
                          debugPrint("Payment failed: ${result.amountFormat}");
                          debugPrint("Payment failed: ${result.callbackUrl}");
                          debugPrint("Payment failed: ${result.currency}");
                          debugPrint("Payment failed: ${result.voidedAt}");
                          debugPrint("Payment failed: ${result.id}");
                          debugPrint("Payment failed: ${result.refunded}");
                          onPaidFailed();
                        }
                      }
                    },
                  ),
                  heightSpace(10.h),
                ],
              ),
            ),
          )
        : PopScope(
            canPop: false,
            child: Container(
              margin: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.r),
                  topEnd: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                    title: LocaleKeys.pay.tr(),
                    ),
                    heightSpace(12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: CreditCard(
                            locale: context.locale.languageCode == "ar"
                                ? const Localization.ar()
                                : const Localization.en(),
                            config: PaymentConfig(
                              publishableApiKey: AppConstants.moyserApiKey,
                              amount: (price * 100).round(),
                              description: LocaleKeys.pay.tr(),
                              creditCard: CreditCardConfig(
                                  saveCard: false, manual: false),
                            ),
                            onPaymentResult: (result) {
                              if (result is ValidationError) {
                                debugPrint("----- ${result.message}");
                              }
                              if (result is PaymentResponse) {
                                debugPrint("----- $result");
                                debugPrint("----- ${result.status}");
                                if (result.status == PaymentStatus.paid) {
                                  debugPrint(result.id.toString());
                                  debugPrint(result.invoiceId.toString());
                                  debugPrint(result.ip.toString());
                                  debugPrint("----- paid");
                                  // getTransactionId(
                                  //     transactionId: result.id.toString());
                                  context.pop();
                                  onPaidSuccess();
                                } else if (result.status ==
                                    PaymentStatus.failed) {
                                  debugPrint(
                                      "Payment failed: ${result.amount}");
                                  debugPrint(
                                      "Payment failed: ${result.callbackUrl}");
                                  debugPrint(
                                      "Payment failed: ${result.currency}");
                                  debugPrint(
                                      "Payment failed: ${result.voidedAt}");
                                  debugPrint(
                                      "Payment failed: ${result.voidedAt}");
                                  onPaidFailed();
                                }
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
