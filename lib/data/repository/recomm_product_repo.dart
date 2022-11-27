import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../utils/app_constant.dart';
import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {

  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    Response res = await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_URI);
    if (res.statusCode == 200) {
      print("loaded recomm product to repo");
    } else {
      print("nothing got");
    }
    return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_URI);
  }

}