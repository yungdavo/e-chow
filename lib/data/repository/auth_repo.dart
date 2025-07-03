import 'package:e_Chow/data/api/api_client.dart';
import 'package:e_Chow/models/sign_up_model.dart';
import 'package:e_Chow/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
  });
  
  Future <Response> registration (SignUpModel signUpModel) async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpModel.toJson());
  }

  Future <String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  bool userLoggedIn()  {
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future <Response> login (String email, String password) async{
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email":email, "password":password});
  }

  Future <bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(
        AppConstants.TOKEN, token);
  }
  Future <void> saveUserNumberAndPassword(String number, String password)async {
    try{
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }
  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token='';
    apiClient.updateHeader('token');
    return true;
  }
}