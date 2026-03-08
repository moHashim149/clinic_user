import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit extends Cubit<String> {
  SelectionCubit(super.initialState);

  void selectOption(String option) {
    emit(option);
  }
}
