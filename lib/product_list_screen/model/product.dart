class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final double? rating;
  final double? stock;
  final String? brand;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.rating,
    this.stock,
    this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['images'][0],
      rating: json['rating']?.toDouble(),
      stock: json['stock']?.toDouble(),
      brand: json['brand'],
    );
  }
}
