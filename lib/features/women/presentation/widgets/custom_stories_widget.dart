import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/features/stories/data/arguments/stories_arguments.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/routing/routes.dart';
import '../cubit/women_cubit.dart';
import 'custom_stories_item_widget.dart';

class CustomStoriesWidget extends StatelessWidget {
  final List<StoreModel> stores;

  const CustomStoriesWidget({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomStoriesItemWidget(
            storeImage: stores[index].logo ?? "",
            storeName: stores[index].name,
            storeAvgRate: "${stores[index].rating}",
            storyThumbnail: stores[index].stories!.firstOrNull?.media ?? "",
            onTap: () {
              context.pushWithNamed(
                Routes.storiesView,
                arguments: StoriesArguments(stories: stores[index].stories!),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(16.w);
        },
        itemCount: stores.length,
      ),
    );
  }
}
