import 'package:vending_machine/models/product.dart';

class ShoppingCart {
  Map<ProductID, int> _productsInCart = {};
  List<Product> _products;
  int _totalPrice = 0;

  ShoppingCart(this._products, this._productsInCart, this._totalPrice);

  factory ShoppingCart.defaultValues(List<Product> products) {
    Map<ProductID, int> productsInCart = {};
    for (var product in products) {
      productsInCart[product.getID()] = 0;
    }
    return ShoppingCart(products, productsInCart, 0);
  }

  //Functions
  void addToCart(ProductID productToAdd) {
    if (_productsInCart.containsKey(productToAdd)) {
      _productsInCart[productToAdd] = _productsInCart[productToAdd]! + 1;
    }
    _updateTotalPrice();
  }

  void removeFromCart(ProductID productToDecrease) {
    if (_productsInCart.containsKey(productToDecrease)) {
      _productsInCart[productToDecrease] =
          _productsInCart[productToDecrease]! - 1;
    }
    _updateTotalPrice();
  }

  void _updateTotalPrice() {
    int totalSum = 0;

    _productsInCart.forEach((productID, quantity) {
      totalSum += quantity *
          _products
              .singleWhere((product) => product.getID() == productID)
              .getPrice()
              .floor();
    });
    _totalPrice = totalSum;
  }

  //Setters and Getters
  Map<ProductID, int> getProductsInCart() {
    Map<ProductID, int> productsWithQuantityGreaterThanZero = {};
    _productsInCart.forEach((productID, quantity) {
      if (quantity > 0) {
        productsWithQuantityGreaterThanZero[productID] = quantity;
      }
    });
    return productsWithQuantityGreaterThanZero;
  }

  int getTotalPrice() => _totalPrice;
}
