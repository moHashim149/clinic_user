import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';
@injectable
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
}
