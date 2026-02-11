
import 'package:brandy_user/features/favorites/data/params/fav_store_param.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';

import '../../models/address_model.dart';
import '../../params/add_address_param.dart';
import '../../params/delete_address_param.dart';
import '../../params/edit_address_param.dart';


abstract class AddressesRemoteDataSource {
  Future<List<AddressModel>> fetchAddresses();
  Future<String> addAddress(AddAddressParam param);
  Future<String> editAddress(EditAddressParam param);
  Future<String> deleteAddress(DeleteAddressParam param);
}
