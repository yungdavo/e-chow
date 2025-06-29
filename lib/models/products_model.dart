class Product { //This the private fields, that's why we use underscore
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel>_products;
  List<ProductModel> get products =>_products;

  Product({required totalSize, required typeId, required offset, required products}){
  this._totalSize=totalSize;
  this._typeId=typeId;
  this._offset=offset;
  this._products=products;
 }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? created_At;
  String? updated_At;
  int? typeId;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.created_At,
        this.updated_At,
        this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    created_At = json['created_at'];
    updated_At = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson(){
   return {
     "id": this.id,
     "name": this.name,
     "price": this.price,
     "img": this.img,
     "location": this.location,
     "created_at": this.created_At,
     "updated_at": this.updated_At,
     "typeId": this.typeId
   };
  }
}