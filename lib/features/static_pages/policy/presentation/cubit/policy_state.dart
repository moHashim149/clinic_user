part of 'policy_cubit.dart';

@immutable
abstract class PolicyState {}

class PolicyInitial extends PolicyState {}
class GetPolicyLoading extends PolicyState {}
class GetPolicyFailure extends PolicyState {
  final String error ;

  GetPolicyFailure({required this.error});
}
class GetPolicySuccess extends PolicyState {}
