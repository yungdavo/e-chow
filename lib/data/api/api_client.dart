import 'package:get/get.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  //variables for initialization
  late String token;
  final String appBaseURL; //server URL

  late Map <String, String> _mainHeaders; //this is for storing data locally

  //API CONSTRUCTOR
  ApiClient ({ required this.appBaseURL}){
    baseUrl = appBaseURL;
    timeout = Duration(seconds: 30); // this how long it should try to get data from server
    token=AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }
void updateHeader(String token){
  _mainHeaders = {
    'Content-type' : 'application/json; charset=UTF-8',
    'Authorization' : 'Bearer $token',
  };
}


 Future <Response> getData(String uri,) async {
    try{//trying to call something from the server
      Response response = await get(uri);//getMethod //
      return response; // returns response as the data
    }catch(e){//but if it fails, catch it here
      return Response(statusCode: 1, statusText:e.toString());
    }
 }

 //this part is for auth
  Future <Response> postData(String uri, dynamic body) async {
    try{
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1, statusText:  e.toString());
    }
 }


}