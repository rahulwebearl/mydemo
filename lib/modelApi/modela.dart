class Product {
  final int id;
  final String title;
  final String description;
  final String brand;
  final int price;
  final dynamic discountPercentage;
  final dynamic rating;
  final int stock;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.brand,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson(data) {
    return Product(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        brand: data['brand'],
        price: data['price'],
        discountPercentage: data['discountPercentage'],
        rating: data['rating'],
        stock: data['stock'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        images: data['images']);
  }
}
