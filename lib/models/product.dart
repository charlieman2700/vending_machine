typedef ProductID = String;

class Product {
  ProductID _id;
  String _imageUrl;
  String _title;
  double _price;

  Product({
    required ProductID id,
    required String imageUrl,
    required String title,
    required double price,
  })  : _id = id,
        _imageUrl = imageUrl,
        _title = title,
        _price = price;

  factory Product.fromMap(
      {required Map<String, dynamic> map, required ProductID id}) {
    return Product(
      id: id,
      imageUrl: map['imageUrl'],
      title: map['title'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> translatedProduct = {
      'id': _id,
      'imageUrl': _imageUrl,
      'title': _title,
      'price': _price,
    };
    return translatedProduct;
  }

// Setters And Getters
  void setID(ProductID id) => _id = id;
  void setImageUrl(String imageUrl) => _imageUrl = imageUrl;
  void setTitle(String title) => _title = title;
  void setPrice(double price) => _price = price;

  ProductID getID() => _id;
  String getImageUrl() => _imageUrl;
  String getTitle() => _title;
  double getPrice() => _price;
}
