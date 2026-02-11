
import 'package:brandy_user/features/product_details/data/models/available_size_model.dart';
import 'package:brandy_user/features/product_details/data/params/available_size_param.dart';

import '../../models/product_model.dart';
import '../../params/product_details_param.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductModel> fetchProductDetails(ProductDetailsParam param);
  Future<List<AvailableSizeModel>> fetchProductAvailableSize(AvailableSizeParam param);
}
