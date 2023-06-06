import 'dart:ffi';

class Product {
  late final int id;
  late final List<dynamic> image;
  late final String name;
  late final String description;
  late final int price;
  late final String weight;
  late final dynamic category;
  late final dynamic subcategory;

  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.weight,
      required this.category,
      required this.subcategory});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['product_image'];
    image.add({
      'image':
          'https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png'
    });
    name = json['name'];
    description = json['description'];
    price = json['price'] == null ? 0 : json['price'];
    json['weight'] == null ? weight = "100" : weight = json['weight'].toString();
    json['category'] == null ? category = 0.0 : category = json['category'];
    json['subcategory'] == null
        ? subcategory = 0
        : subcategory = json['subcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    return data;
  }
}
