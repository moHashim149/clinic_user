
import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/store_details_model.dart';
import '../params/section_products_param.dart';
import '../params/store_details_param.dart';

abstract class StoreDetailsRepository {
   Future<Either<Failure, StoreDetailsModel>> fetchStoreDetails(StoreDetailsParam param);
   Future<Either<Failure, PaginationDataModel<ProductModel>>> fetchSectionProducts(SectionProductsParam param);
}
