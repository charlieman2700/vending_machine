import 'package:vending_machine/models/product.dart';

class ShoppingCart {
  Map<Product, int> _productsInCart = {};
  int _totalPrice = 0;

  ShoppingCart(this._productsInCart, this._totalPrice);

  factory ShoppingCart.defaultValues(List<Product> products) {
    Map<Product, int> productsInCart = {};
    for (var product in products) {
      productsInCart[product] = 0;
    }
    return ShoppingCart(productsInCart, 0);
  }

  //Functions
  void addToCart(ProductID productToAdd) {
    if (_productsInCart.containsKey(productToAdd)) {
      Product productKey = _productsInCart.keys
          .singleWhere((product) => product.getID() == productToAdd);

      _productsInCart[productKey] = _productsInCart[productKey]! + 1;
    }
  }

  void removeFromCart(ProductID productToDecrease) {
    if (_productsInCart.containsKey(productToDecrease)) {
      Product productKey = _productsInCart.keys
          .singleWhere((product) => product.getID() == productToDecrease);

      _productsInCart[productKey] = _productsInCart[productKey]! - 1;
    }
  }

  void updateTotalPrice() {
    int totalSum = 0;
    _productsInCart.forEach((product, quantity) {
      totalSum += quantity;
    });
    _totalPrice = totalSum;
  }

  //Setters and Getters
  Map<Product, int> getProductsInCart() => _productsInCart;
  int getTotalPrice() => _totalPrice;
}
