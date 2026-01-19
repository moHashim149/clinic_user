import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_empty_data_widget.dart';
import 'package:brandy_user/features/favorites/presentation/widgets/custom_favorites_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../women/presentation/widgets/custom_store_item_widget.dart';
import '../cubit/favorites_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "المتاجر المفضلة"),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final cubit = context.read<FavoritesCubit>();
          if (state is FavoritesLoading) {
            return CustomLoading();
          } else if (state is FavoritesFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                // cubit.fetchHome();
              },
            );
          } else {
            return 0 == 0
                ? CustomFavoritesListWidget()
                : CustomEmptyDataWidget(
                    text: "لاتوجد لديكِ صالونات في قائمة المفضلة",
                    image: AppAssets.emptyFav,
                  );
          }
        },
      ),
    );
  }
}
