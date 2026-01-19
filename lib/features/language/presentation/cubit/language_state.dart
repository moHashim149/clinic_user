part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}
final class LanguageLoading extends LanguageState {}
final class LanguageLoaded extends LanguageState {}
final class LanguageFailure extends LanguageState {
  final String error;

  LanguageFailure({required this.error});
}
