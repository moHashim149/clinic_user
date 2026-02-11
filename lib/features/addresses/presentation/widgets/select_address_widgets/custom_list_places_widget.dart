import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/extensions/on_tap.dart';
import '../../cubit/search_places_cubit/search_places_bloc.dart';

class CustomListPlacesWidget extends StatelessWidget {
  final SearchPlacesBloc bloc;

  const CustomListPlacesWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListView.separated(
        padding: EdgeInsets.all(8.w),
        itemCount: bloc.places.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            Divider(color: AppColors.whiteColor),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child:
              Row(
                children: [
                  SvgPicture.asset(AppAssets.search),
                  widthSpace(5.w),
                  Expanded(
                    child: Text(
                      bloc.places[index].name,
                      style: AppTextStyles.textStyle12.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ).onTapShadow(
                function: () {
                  bloc.add(GetPlaceCoordinates(placeId: bloc.places[index].id));
                },
              ),
        ),
      ),
    );
  }
}
