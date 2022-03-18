class HomeModel
{
  bool? status;
  HomeModel? data;

  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['status'];
  }
}

class HomeDataModel
{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json)
  {
    json['banners'].forEach((element)
    {
      banners.add(element);
    });
    json['products'].forEach((element)
    {
      products.add(element);
    });

  }
}

class BannerModel
{
  int? id;
  String? image;

  BannerModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel
{
  int? id;
  dynamic price;
  dynamic discount;
  String? name;
  String? image;
  bool? inFavorites;
  bool? inCart;
  ProductModel.fromJson(Map<String, dynamic> json)
  {
    price = json['price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    id = json['id'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}