class Product {
  late final int id;
  late final String image;
  late final String name;
  late final String description;
  late final int price;
  late final double weight;
  late final int category;
  late final int subcategory;

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
    if (json['product_image'] != []) {
      image = json['product_image'][0]['image'];
    } else {
      image =
          'https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png';
    }
    name = json['name'];
    description = json['description'];
    price = json['price'];
    weight = 100;
    // weight = json['weight'];
    category = json['category'];
    subcategory = json['subcategory'];
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
