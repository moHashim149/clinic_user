
import 'package:brandy_user/features/product_details/data/models/available_size_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/product_model.dart';
import '../params/available_size_param.dart';
import '../params/product_details_param.dart';

abstract class ProductDetailsRepository {
   Future<Either<Failure, ProductModel>> fetchProductDetails(ProductDetailsParam param);
   Future<Either<Failure, List<AvailableSizeModel>>> fetchAvailableSize(AvailableSizeParam param);
}
