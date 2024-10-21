class Product {
  int id;
  String title;
  String description;
  double price;
  String image;
  double rating;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      price: map["price"] ?? 0.0,
      rating: map["rating"] ?? 0,
      image: map["image"] ?? "",
    );
  }
}
