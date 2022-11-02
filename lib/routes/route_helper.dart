import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/cart/cartPage.dart';
import '../pages/food/popular_food_detail.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId , String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int foodId , String page)=>'$recommendedFood?foodId=$foodId&page=$page';
  static String getCartPage()=> '$cartPage';




  static List<GetPage> routes=[
    GetPage(name: "/", page:()=>MainFoodPage()),

    GetPage(name: popularFood, page:(){
      var page = Get.parameters['page'];
      var pageId= Get.parameters['pageId'];
      print("Popular_Food_Page get called");
      return PopularFoodDetails(pagedId:int.parse(pageId!) , page: page!);
    },
      transition: Transition.leftToRightWithFade
    ),
    GetPage(name: recommendedFood, page:(){

      var foodId = Get.parameters['foodId'];
      var page = Get.parameters['page'];
      print("Recommended_Food_Page get called");
      return RecommendedFoodDetails(foodId:int.parse(foodId!) ,page: page!);
    },
        transition: Transition.leftToRightWithFade
    ),


    GetPage(name: cartPage, page:(){
      //var pageId = Get.parameters['foodId'];
      return CartPage();
    } ,
      transition: Transition.leftToRightWithFade
    )

    //   return PopularFoodDetails();

  ];
}