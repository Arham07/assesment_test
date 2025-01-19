import 'package:assesment_app/presentation/trending/trending_model.dart';
import 'package:flutter/foundation.dart';
import '../../data/network/apiUrls/api_endpoints.dart';
import '../../data/network/network_api_services.dart';

class TrendingRepository {
  final NetworkApiService _networkApiService = NetworkApiService();

  Future<TrendingModel> showTrendingRepositoriesRepo(
      Map<String, dynamic> queryParameter) async {
    try {
      dynamic response = await _networkApiService.GetResponse(
          url: ApiEndPointUrls.searchRepositories,
          isTokenRequired: true,
          queryParameter: queryParameter);

      print("showTrendingRepositoriesRepo ==> $response");
      return TrendingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
