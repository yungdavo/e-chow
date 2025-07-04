import 'package:e_Chow/pages/Cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controllers.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';


class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    //print("current height is "+MediaQuery.of(context).size.height.toString());

    var product= Get.find<PopularProductController>().popularProductList[pageId];
    //print("pageId is id"+pageId.toString());
    //print("product name is"+product.name.toString());
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white, //scaffold color
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
            width: double.maxFinite,  //this is to make the image take the whole width of the screen
            height: Dimensions.popularFoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, // this make the image fit the container
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.image!
                  ),
              ),
            ),
              ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height55,
            left: Dimensions.width20, 
            right:Dimensions.width20 , 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                        onTap: (){
                          if(page == "cartpage"){
                            Get.toNamed(RouteHelper.getCartPage());
                            }else{
                            Get.toNamed(RouteHelper.getInitial());
                          }
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios_new),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                      onTap: (){
                        if(controller.totalItems >= 1) //this one makes sure there's at least 1 item to go to cart page
                         Get.toNamed(RouteHelper.getCartPage()
                         );
                      },
                      child: Stack(//we duplicated the AppIcon, for shape and number
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          controller.totalItems >= 1? //find and call totalItems from product controller
                          Positioned(
                            right:0,
                            top: 0,
                            child: AppIcon(
                              icon: Icons.circle, size: 20,
                              iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                            ),
                          ):
                              Container(),
                          Get.find<PopularProductController>().totalItems >= 1?
                          Positioned(
                            right:3,
                            top: 3,
                              child: BigText(
                                text:Get.find<PopularProductController>().totalItems.toString(),
                                size: 12,
                                color:Colors.white,
                              ),
                            ):
                          Container()
                        ],
                      ),
                    );
                  })
                ],
              ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(//.only because we want only some specific part
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(height: Dimensions.height10,),
                    BigText(text: "About Meal",),
                    SizedBox(height: Dimensions.height10,),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text: product.description!
                          ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
      //Bottom bar section
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(//this is to add our items in the middle
              top: Dimensions.height30, bottom: Dimensions.height30,
              left: Dimensions.width20, right: Dimensions.width20
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only( // to curve the the top right and top left
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20, bottom: Dimensions.height20,
                    left:Dimensions.width20, right: Dimensions.width20 ),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                  ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(Icons.remove, color: AppColors.signColor,),
                    ),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                        onTap: (){
                            popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor,),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                    popularProduct.addItem(product);
                },
                child: Container(
                      child: BigText(
                        text: "\$ ${product.price!} | Add to Cart",
                        color: Colors.white
                      ),
                    padding: EdgeInsets.only(
                      top: Dimensions.height20, bottom: Dimensions.height20,
                      left:Dimensions.width20, right: Dimensions.width20 ),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
