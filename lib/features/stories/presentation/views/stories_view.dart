import 'package:brandy_user/core/util/extensions/directionality.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/widgets/custom_loading.dart';
import 'package:brandy_user/features/stories/data/arguments/stories_arguments.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoriesView extends StatefulWidget {
  final StoriesArguments arguments;
  const StoriesView({super.key, required this.arguments});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: context.isArabic ? TextDirection.ltr : TextDirection.rtl,
        child: StoryView(
          storyItems: List.generate(widget.arguments.stories.length, (index) {
            return StoryItem.pageImage(
              url: widget.arguments.stories[index].media,
              controller: controller,
              loadingWidget: CustomLoading(),
              imageFit: BoxFit.cover,
            );
          }),
          controller: controller,
          onComplete: () {
            context.pop();
          },
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
