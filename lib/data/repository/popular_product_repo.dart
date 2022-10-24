import 'package:e_commerceapp/utils/app_constant.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../api/api_client.dart';

class PopularProductRepo extends GetxService{

  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async{
    Response res =await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);
    if(res.statusCode==200){
      print("got product");

    }else{
      print("nothing got");

    }
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);

  }









}