import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController{

  final PopularProductRepo recommendedProductRepo;


  RecommendedProductController({ required this.recommendedProductRepo});
  List <dynamic> _recommendedProductList=[];
  List <dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;
  Future <void > getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getPopularProductList();
    if(response.statusCode==200){

      print("got recomm product");
      _recommendedProductList =[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded= true;
      update();

    }else{
      print("no product");

    }
  }





}