class ProductList {
  int? totalSize;
  int? typeId;
  int? offset;
  List<ProductModel> products = [];

  ProductList({
    this.totalSize,
    this.typeId,
    this.offset,
    required this.products,
  });

  ProductList.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    typeId = json['type_id'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = List<ProductModel>.from(
        json['products'].map((v) => ProductModel.fromJson(v)),
      );
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? stars;
  String? price; // kept as string to match Laravel's API
  int? productCategoryId;
  Category? category;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.stars,
    this.price,
    this.productCategoryId,
    this.category,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    stars = json['stars'];
    price = json['price'].toString(); // defensive cast
    productCategoryId = json['product_category_id'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'stars': stars,
      'price': price,
      'product_category_id': productCategoryId,
      'category': category?.toJson(),
    };
  }
}

class Category {
  int? id;
  String? title;
  String? description;
  int? parentId;

  Category({
    this.id,
    this.title,
    this.description,
    this.parentId,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title':title,
      'description': description,
      'parent_Id' : parentId,
    };
  }
}




/*
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
  String? img;
  int? price;
  int? stars;
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
}*/
