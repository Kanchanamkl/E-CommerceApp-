import 'package:e_commerceapp/utils/app_constant.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  final String appBaseUrl;

  late Map<String , String> _mainHeaders;

  ApiClient( { required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token= AppConstant.TOKEN;
    _mainHeaders= {
      'Content-type': 'application/json; charset =UTF-8 ',
      'Authorization':'Bearer ',
    };

  }


  Future <Response> getData(String uri) async{
    try{
      Response response = await get(uri);
      if(response.statusCode==200){
        print("got response");
      }else{
        print(" nothing got");
      }
      return response;
    }catch (e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


}