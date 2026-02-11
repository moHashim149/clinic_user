
import 'package:flutter/material.dart';

import '../models/address_model.dart';


class SelectAddressArgument {
  final AddressModel? addressModel;
  final VoidCallback onUpdate;
  SelectAddressArgument({this.addressModel, required this.onUpdate,});
}
