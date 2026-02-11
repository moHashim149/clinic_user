import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/address_model.dart';
import '../params/add_address_param.dart';
import '../params/delete_address_param.dart';
import '../params/edit_address_param.dart';

abstract class AddressesRepository {
  Future<Either<Failure, List<AddressModel>>> fetchAddresses();
  Future<Either<Failure, String>> addAddress(AddAddressParam param);
  Future<Either<Failure, String>> editAddress(EditAddressParam param);
  Future<Either<Failure, String>> deleteAddress(DeleteAddressParam param);
}
