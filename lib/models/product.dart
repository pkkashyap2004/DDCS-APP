class Product {
  const Product({required this.id, required this.name, required this.description, required this.price, this.imageUrl});
  final String id, name, description;
  final num price;
  final String? imageUrl;
  factory Product.fromMap(Map<String, dynamic> map) => Product(id: map['id'].toString(), name: map['name'] as String? ?? 'Product', description: map['description'] as String? ?? '', price: map['price'] as num? ?? 0, imageUrl: map['image_url'] as String?);
}
