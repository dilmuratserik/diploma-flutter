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
    if (json['product_image'] != null) {
      image = json['product_image'][0]['image'];
    } else {
      image = 'https://tkcert.su/uploads/sert-tovarov/deklaracija-na-syr.jpg';
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

  Product.fromCustomJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    image = json['product_image'];
    name = json['name'];
    description = json['description'];
    price = int.parse(json['price'].toString());
    weight = json['weight'];
    category = int.parse(json['category'].toString());
    subcategory = int.parse(json['subcategory'].toString());
  }
}
