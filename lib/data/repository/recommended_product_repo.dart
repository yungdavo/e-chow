import 'package:get/get.dart';
import '../../models/products_model.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient; // created to pass data to n fro api client
  RecommendedProductRepo({required this.apiClient});
//before initializing the repo, we first pass API CLIENT

  Future<List<ProductModel>> getRecommendedProductList() async {
    Response response = await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);

    if (response.statusCode == 200) {
      return (response.body as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to load recommended products");
    }
  }
}
