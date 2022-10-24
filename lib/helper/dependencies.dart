import 'package:e_commerceapp/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recomm_product_repo.dart';

Future <void> init() async {
// api client

 Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstant.BASE_URL));

// repos
  Get.lazyPut(()=> PopularProductRepo(apiClient: Get.find()));
 Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));


//controllers
  Get.lazyPut(()=> PopularProductController(popularProductRepo:Get.find()));
 Get.lazyPut(()=> RecommendedProductController(recommendedProductRepo:Get.find()));




}