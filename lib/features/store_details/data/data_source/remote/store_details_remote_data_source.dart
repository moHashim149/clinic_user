
import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:brandy_user/features/store_details/data/params/section_products_param.dart';

import '../../models/store_details_model.dart';
import '../../params/store_details_param.dart';

abstract class StoreDetailsRemoteDataSource {
  Future<StoreDetailsModel> fetchStoreDetails(StoreDetailsParam param);
  Future<PaginationDataModel<ProductModel>> fetchSectionProducts(SectionProductsParam param);
}
