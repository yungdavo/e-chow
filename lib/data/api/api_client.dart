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
      //Map is marked late because its meant to be initialised before use
      //maps are wrapped around {} list are wrapped around {}
      //Maps takes key and value
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
}