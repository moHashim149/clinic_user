part of 'create_acc_cubit.dart';

@immutable
abstract class CreateAccState {}

class CreateAccInitial extends CreateAccState {}

class ChangeValueDropDown extends CreateAccState {}


class CreateAccLoading extends CreateAccState {}
class CreateAccFailure extends CreateAccState {}

class GetCitiesLoading extends CreateAccState {}
class GetCitiesSuccess extends CreateAccState {}
class GetCitiesFailure extends CreateAccState {
  final String error ;

  GetCitiesFailure({required this.error});
}

class GetTermsLoading extends CreateAccState {}
class GetTermsSuccess extends CreateAccState {}
class GetTermsFailure extends CreateAccState {
  final String error ;

  GetTermsFailure({required this.error});
}

class GetCommissionLoading extends CreateAccState {}
class GetCommissionSuccess extends CreateAccState {}
class GetCommissionFailure extends CreateAccState {
  final String error ;

  GetCommissionFailure({required this.error});
}


