import 'package:brandy_user/features/addresses/data/params/add_address_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/address_model.dart';
import '../../params/delete_address_param.dart';
import '../../params/edit_address_param.dart';
import 'addresses_remote_data_source.dart';

@Injectable(as: AddressesRemoteDataSource)
class AddressesRemoteDataSourceImpl implements AddressesRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AddressesRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<AddressModel>> fetchAddresses() async {
    BaseResponse response = await _apiConsumer.get(ApiConstants.addresses);
    if (response.status == true) {
      return (response.data as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> addAddress(AddAddressParam param) async {
    BaseResponse response = await _apiConsumer.post(
      ApiConstants.addresses,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> editAddress(EditAddressParam param) async {
    BaseResponse response = await _apiConsumer.post(
      ApiConstants.updateAddress(param.id),
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> deleteAddress(DeleteAddressParam param) async {
    BaseResponse response = await _apiConsumer.delete(
      ApiConstants.deleteAddress(param.id),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
