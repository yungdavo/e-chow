import 'dart:convert';
import 'package:e_Chow/models/user_model.dart';
import 'package:get/get.dart';
import '../data/repository/user_repo.dart';
import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;
  UserModel? _userModel; // made nullable

  bool get isLoading => _isLoading;
  UserModel? get userModel => _userModel;

  Future<void> getUserInfo() async {
    try {
      Response response = await userRepo.getUserInfo();
      print("Raw user info response: ${response.body}");

      if (response.statusCode == 200) {
        _userModel = UserModel.fromJson(response.body);
        print("User loaded: ${_userModel?.name}");
      } else {
        print("Failed to get user info: ${response.statusCode}-${response.statusText}");
      }
    } catch (e) {
      print("Exception in getUserInfo: $e");
    }
    _isLoading = false;
    update();
  }
}