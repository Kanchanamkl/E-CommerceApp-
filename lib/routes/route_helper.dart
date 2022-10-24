import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/food/popular_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{
  static const String initiate = "/";
  static const String popularFood = "popular-food";

  static String getPopularFood()=>'$popularFood';

  static List<GetPage> routes=[
    GetPage(name: "/", page:()=>MainFoodPage()),
    GetPage(name: popularFood, page:(){
      return PopularFoodDetails();

    }),

    //   return PopularFoodDetails();

  ];
}