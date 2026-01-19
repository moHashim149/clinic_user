import 'package:brandy_user/features/static_pages/data/data_source/remote/static_pages_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_consumer.dart';

@Injectable(as: StaticPagesRemoteDataSource)
class StaticPagesRemoteDataSourceImpl extends StaticPagesRemoteDataSource {
  final ApiConsumer apiConsumer;

  StaticPagesRemoteDataSourceImpl({required this.apiConsumer});





  // @override
  // Future<String> fetchTerms() async {
  //   BaseResponse response = await apiConsumer.get(ApiConstants.terms);
  //   if (response.status == true) {
  //     return response.data.toString();
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
  //
  //
  // @override
  // Future<String> fetchAboutUs() async {
  //   BaseResponse response = await apiConsumer.get(ApiConstants.aboutUs);
  //   if (response.status == true) {
  //     return response.data.toString();
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
}
