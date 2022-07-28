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

  bool canRemoveFromCart(ProductID productId) {
    if (_productsInCart.containsKey(productId) &&
        _productsInCart[productId]! > 0) {
      return true;
    } else {
      return false;
    }
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

  int productQuantityInCart(ProductID productID) {
    int? amount = _productsInCart[productID];
    if (amount != null) {
      return amount;
    }
    return 0;
  }

  bool cartIsEmpy() {
    bool isEmpty = true;
    _productsInCart.forEach((key, value) {
      if (value > 0) {
        isEmpty = false;
      }
    });
    return isEmpty;
  }

  //Setters and Getters
  Map<Product, int> getProductsInCart() {
    Map<Product, int> productsWithQuantityGreaterThanZero = {};
    _productsInCart.forEach((productID, quantity) {
      if (quantity > 0) {
        Product productName =
            _products.singleWhere((element) => element.getID() == productID);

        productsWithQuantityGreaterThanZero[productName] = quantity;
      }
    });
    return productsWithQuantityGreaterThanZero;
  }

  int getTotalPrice() => _totalPrice;
}
