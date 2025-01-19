import 'package:assesment_app/presentation/trending/trending_model.dart';
import 'package:assesment_app/repositories/trending_repository/trending_repository.dart';
import 'package:flutter/foundation.dart';
import '../../../data/response/api_response.dart';

class TrendingViewModel with ChangeNotifier {
  TrendingRepository trendingRepository = TrendingRepository();

  ApiResponse<TrendingModel> followupList = ApiResponse.loading();

  setFollowupListList(ApiResponse<TrendingModel> response) {
    followupList = response;
    notifyListeners();
  }

  // Future<void> getProgressNoteApi() async {
  //   setFollowupListList(ApiResponse.loading());
  //   ///  queryParameter
  //   trendingRepository.showTrendingRepositoriesRepo('queryParameter').then((value) {
  //     print('*********************Success*********************');
  //     print(value);
  //     setFollowupListList(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print('*********************Error*********************');
  //       print(error.toString());
  //       print(stackTrace);
  //     }
  //     setFollowupListList(ApiResponse.error(error.toString()));
  //   });
  // }
}

