import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repository/static_pages_repository.dart';

part 'policy_state.dart';

@injectable
class PolicyCubit extends Cubit<PolicyState> {
  final StaticPagesRepository repository;

  PolicyCubit(this.repository) : super(PolicyInitial());

  String? policyData;

  // void fetchPolicy() async {
  //   emit(GetPolicyLoading());
  //   var result = await repository.fetchPolicy();
  //   result.fold(
  //     (failure) {
  //       emit(GetPolicyFailure(error: failure.message));
  //     },
  //     (policyData) {
  //       this.policyData = policyData;
  //       emit(GetPolicySuccess());
  //     },
  //   );
  // }
}
