import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_empty_data_widget.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/reservation_model.dart';
import '../widgets/custom_reservations_tab_widget.dart';
import '../widgets/reservation_item_widget.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../data/models/reservation_details_model.dart';

class ReservationsView extends StatefulWidget {
  const ReservationsView({super.key});

  @override
  State<ReservationsView> createState() => _ReservationsViewState();
}

class _ReservationsViewState extends State<ReservationsView> {
  bool isCurrentSelected = true;

  // Mock data for UI demonstration
  final List<ReservationModel> mockReservations = [
    ReservationModel(
      id: 1,
      offerNumber: "45896",
      orderNumber: "#1223334",
      status: LocaleKeys.orderStatusNew.tr(),
      statusKey: "new",
      price: 500.70,
      date: "02/06/2026",
      locationDistrict: "حي السويدي",
      locationSubText: "مجمع الرياض امام مسجد الفرج",
      isPrevious: false,
    ),
    ReservationModel(
      id: 2,
      offerNumber: "45897",
      orderNumber: "#1223335",
      status: LocaleKeys.orderStatusCurrent.tr(),
      statusKey: "current",
      price: 350.00,
      date: "05/06/2026",
      locationDistrict: "حي العقيق",
      locationSubText: "مجمع العقيق بلازا",
      isPrevious: false,
    ),
    ReservationModel(
      id: 3,
      offerNumber: "45898",
      orderNumber: "#1223336",
      status: LocaleKeys.orderStatusEnded.tr(),
      statusKey: "ended",
      price: 150.00,
      date: "01/01/2026",
      locationDistrict: "حي الملقا",
      locationSubText: "عيادات الملقا الحديثة",
      isPrevious: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter list based on selected tab
    final filteredList = mockReservations
        .where((element) => element.isPrevious == !isCurrentSelected)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 175.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0x66EDEDED), Color(0xFFEDFFFA)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 24.w),
                      Text(
                        LocaleKeys.myReservations.tr(),
                        style: AppTextStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CustomBackWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        heightSpace(24.h),
                        CustomReservationsTabWidget(
                          isCurrentSelected: isCurrentSelected,
                          onCurrentTap: () {
                            setState(() {
                              isCurrentSelected = true;
                            });
                          },
                          onPreviousTap: () {
                            setState(() {
                              isCurrentSelected = false;
                            });
                          },
                          currentText: LocaleKeys.currentReservations.tr(),
                          previousText: LocaleKeys.previousReservations.tr(),
                        ),
                        heightSpace(24.h),
                        Expanded(
                          child: filteredList.isEmpty
                              ? CustomEmptyDataWidget(
                                  text: LocaleKeys.noActiveReservations.tr(),
                                )
                              : ListView.builder(
                                  itemCount: filteredList.length,
                                  padding: EdgeInsets.only(bottom: 24.h),
                                  itemBuilder: (context, index) {
                                    return ReservationItemWidget(
                                      reservation: filteredList[index],
                                      onTap: () {
                                        // Mocking details model for UI
                                        final mockDetails = ReservationDetailsModel(
                                          id: filteredList[index].id,
                                          offerNumber:
                                              filteredList[index].offerNumber,
                                          orderNumber:
                                              filteredList[index].orderNumber,
                                          status: filteredList[index].status,
                                          statusKey:
                                              filteredList[index].statusKey ==
                                                  'new'
                                              ? 1
                                              : filteredList[index].statusKey ==
                                                    'current'
                                              ? 2
                                              : 3,
                                          isPrevious:
                                              filteredList[index].isPrevious,
                                          date: filteredList[index].date.split(
                                            ' ',
                                          )[0],
                                          time: "10:00 AM", // Mock time
                                          clinicName:
                                              "عيادات راما الطبية - فرع السويدي",
                                          clinicRating: 4.8,
                                          locationDistrict: filteredList[index]
                                              .locationDistrict,
                                          locationSubText: filteredList[index]
                                              .locationSubText,
                                          latitude: 24.7136,
                                          longitude: 46.6753,
                                          sessionsCount: 3,
                                          offerImage: AppAssets.testImage,
                                          originalPrice:
                                              filteredList[index].price + 50.0,
                                          discount: 50.0,
                                          priceAfterDiscount:
                                              filteredList[index].price,
                                          vat: 0.0, // Mock VAT
                                          total: filteredList[index].price,
                                        );
                                        context.pushWithNamed(
                                          Routes.reservationDetailsView,
                                          arguments: mockDetails,
                                        );
                                      },
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
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
