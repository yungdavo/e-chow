import 'package:get/get.dart';
import '../../models/products_model.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient; // created to pass data to n fro api client
  PopularProductRepo({required this.apiClient});

//before initializing the repo, we first pass API CLIENT

/*
    Future <Response> getPopularProductList() async {
      return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); // only put end point
    }
}*/


  Future<List<ProductModel>> getPopularProductList() async {
    Response response = await apiClient.getData(
        AppConstants.POPULAR_PRODUCT_URI);

    if (response.statusCode == 200) {
      return (response.body as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to load popular products");
    }
  }
}
