import 'package:brandy_user/features/addresses/data/models/address_model.dart';
import 'package:brandy_user/features/addresses/data/params/add_address_param.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/addresses_remote_data_source.dart';
import '../params/delete_address_param.dart';
import '../params/edit_address_param.dart';
import 'addresses_repository.dart';


@Injectable(as: AddressesRepository)
class AddressesRepositoryImpl implements AddressesRepository {
  final AddressesRemoteDataSource addressesRemoteDataSource;

  AddressesRepositoryImpl(this.addressesRemoteDataSource);

  @override
  Future<Either<Failure, List<AddressModel>>> fetchAddresses() async {
    try {
      final result = await addressesRemoteDataSource.fetchAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addAddress(AddAddressParam param) async {
    try {
      final result = await addressesRemoteDataSource.addAddress(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editAddress(EditAddressParam param) async {
    try {
      final result = await addressesRemoteDataSource.editAddress(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAddress(DeleteAddressParam param) async {
    try {
      final result = await addressesRemoteDataSource.deleteAddress(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

}
