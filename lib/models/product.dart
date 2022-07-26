typedef ProductID = String;

class Product {
  ProductID _id;
  String _imageUrl;
  String _title;
  double _price;
  int _availableQuantity;

  Product(
      {required ProductID id,
      required String imageUrl,
      required String title,
      required double price,
      required int availableQuantity})
      : _id = id,
        _imageUrl = imageUrl,
        _title = title,
        _price = price,
        _availableQuantity = availableQuantity;

  factory Product.fromMap(
      {required Map<String, dynamic> map, required ProductID id}) {
    return Product(
        id: id,
        imageUrl: map['imageUrl'],
        title: map['title'],
        price: map['price'],
        availableQuantity: map['avaliableQuantity']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> translatedProduct = {
      'id': _id,
      'imageUrl': _imageUrl,
      'title': _title,
      'price': _price,
      'availableQuantity': _availableQuantity
    };
    return translatedProduct;
  }

  void decreaseAvailableQuantity(int decreaseBy) =>
      _availableQuantity -= decreaseBy;

// Setters And Getters
  void setID(ProductID id) => _id = id;
  void setImageUrl(String imageUrl) => _imageUrl = imageUrl;
  void setTitle(String title) => _title = title;
  void setPrice(double price) => _price = price;
  void setAvailableQuantity(int newQuantity) =>
      _availableQuantity = newQuantity;

  ProductID getID() => _id;
  String getImageUrl() => _imageUrl;
  String getTitle() => _title;
  double getPrice() => _price;
  int getAvailableQuantity() => _availableQuantity;
}
