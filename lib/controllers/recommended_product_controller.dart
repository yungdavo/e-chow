import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

/*
class RecommendedProductController extends GetxController{
  //GetxControllers are only for repo or api client
  //BEFORE WE INITIALIZE CONTROLLER, WE FIRST PASS REPO
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List <dynamic> _recommendedProductList=[]; // this is to save data gotten from repo
  List <dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded =>_isLoaded;

  Future <void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    //when this is called, it goes to api_client, finds response and sends to repo and to controller
    if(response.statusCode==200){

      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products); //we are waiting for the model to use here
      // print(_popularProductList);
      _isLoaded=true;
      update();
    }else{
      print("Couldn't get product");
    }
  }
}*/
class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      try {
        _recommendedProductList = (response.body as List)
            .map((data) => ProductModel.fromJson(data))
            .toList();
        _isLoaded = true;
        update();
      } catch (e) {
        print("Recommended parsing error: $e");
      }
    } else {
      print("Couldn't get product: ${response.statusText}");
    }
  }
}

