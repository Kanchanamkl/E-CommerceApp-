import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';

  static String getRecommendedFood()=>'$recommendedFood';

  static List<GetPage> routes=[
    GetPage(name: "/", page:()=>MainFoodPage()),
    GetPage(name: popularFood, page:(){
      var pageId= Get.parameters['pageId'];
      print("Popular_Food_Page get called");
      return PopularFoodDetails(pagedId:int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page:(){
      print("Recommended_Food_Page get called");
      return RecommendedFoodDetails();
    },
        transition: Transition.leftToRightWithFade
    ),

    //   return PopularFoodDetails();

  ];
}