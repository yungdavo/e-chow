import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient; // created to pass data to n fro api client
  RecommendedProductRepo({required this.apiClient});
//before initializing the repo, we first pass API CLIENT

  Future <Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI); // only put end point
  }
}