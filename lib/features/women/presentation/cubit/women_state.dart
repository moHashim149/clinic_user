part of 'women_cubit.dart';

abstract class WomenState{}

class WomenInitial extends WomenState {}

class ChangePageIndexState extends WomenState {}

class DataLoading extends WomenState {}
class DataLoaded extends WomenState {}
class DataFailure extends WomenState {
  final String error;

  DataFailure({required this.error});
}



