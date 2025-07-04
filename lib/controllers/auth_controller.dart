import 'package:e_Chow/data/api/api_client.dart';
import 'package:e_Chow/data/repository/auth_repo.dart';
import 'package:e_Chow/models/response_model.dart';
import 'package:e_Chow/models/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future <ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading = true;
    update();

    Response response = await authRepo.registration(signUpModel);
    late ResponseModel responseModel;

    if(response.statusCode==200){
      authRepo.saveUserToken(response.body["token"]);
      Get.find<ApiClient>().updateHeader("token");
      responseModel = ResponseModel(true, response.body["token"]);
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future <ResponseModel> login(String email, String password) async {

    _isLoading = true;
    update();

    Response response = await authRepo.login(email, password);

    late ResponseModel responseModel;

    if(response.statusCode==200){

      authRepo.saveUserToken(response.body["token"]);
      Get.find<ApiClient>().updateHeader("token");
      print("My token is" + response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn()  {
    return  authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}