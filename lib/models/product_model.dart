class Product {
  final String mainTitle;
  final ProductDescription description;

  Product(this.mainTitle, this.description);
}


class ProductDescription {
  final String image;
  final String title;
  final String description;
  final String price;

  ProductDescription(this.image, this.title, this.description, this.price);
}