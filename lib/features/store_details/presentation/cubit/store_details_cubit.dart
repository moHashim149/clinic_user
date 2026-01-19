import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'store_details_state.dart';
@injectable
class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  StoreDetailsCubit() : super(StoreDetailsInitial());
}
