import 'package:e_commerceapp/pages/cart/cartPage.dart';
import 'package:e_commerceapp/pages/food/popular_food_detail.dart';
import 'package:e_commerceapp/pages/food/recommended_food_detail.dart';
import 'package:e_commerceapp/pages/home/food_page_body.dart';
import 'package:e_commerceapp/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

import 'package:e_commerceapp/pages/home/main_food_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      //home:  MainFoodPage(),
      initialRoute: RouteHelper.initial,  // initialRoute: RouteHelper.getInitial()  -> both are same
      getPages: RouteHelper.routes,


    );
  }
}



