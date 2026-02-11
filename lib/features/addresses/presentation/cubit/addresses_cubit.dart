import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/addresses/data/models/address_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/addresses_repository.dart';

part 'addresses_state.dart';
@injectable
class AddressesCubit extends Cubit<AddressesState> {
  final AddressesRepository addressesRepository;
  AddressesCubit(this.addressesRepository) : super(AddressesInitial());

  List<AddressModel> addresses = [];

  Future<void> fetchAddresses() async {
      emit(AddressesLoading());
    final result = await addressesRepository.fetchAddresses();
    result.fold(
          (failure) {
          emit(AddressesFailure(error: failure.message));
      },
          (addresses) async {
        this.addresses = addresses;
        emit(AddressesLoaded());
      },
    );
  }

}
