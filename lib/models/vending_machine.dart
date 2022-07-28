import 'package:vending_machine/models/money_manager.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/shopping_cart.dart';

class VendingMachine {
  final List<Product> _products;
  final Map<ProductID, int> _productStock;
  final MoneyManager _moneyManager;
  final ShoppingCart _shoppingCart;

  VendingMachine(this._products, this._productStock, this._moneyManager,
      this._shoppingCart);

  factory VendingMachine.defaultProductStock() {
    List<Product> defaultProducts = [
      Product(id: '1', imageUrl: 'null', title: 'Coca Cola', price: 500),
      Product(id: '2', imageUrl: 'null', title: 'Pepsi', price: 600),
      Product(id: '3', imageUrl: 'null', title: 'Fanta', price: 550),
      Product(id: '4', imageUrl: 'null', title: 'Sprite', price: 725)
    ];
    Map<ProductID, int> defaultProductStock = {
      '1': 10,
      '2': 8,
      '3': 10,
      '4': 15,
    };
    ShoppingCart defaultShoppingCart =
        ShoppingCart.defaultValues(defaultProducts);

    return VendingMachine(defaultProducts, defaultProductStock,
        MoneyManager.withDefaultCoinPool(), defaultShoppingCart);
  }

  void decreaseProductStock(ProductID id, int decreaseBy) {
    _productStock[id] = _productStock[id]! - decreaseBy;
  }

  void increaseProductStock(ProductID id, int increaseBy) {
    _productStock[id] = _productStock[id]! + increaseBy;
  }

  void addProductToShoppingCart(ProductID productID) {
    int productStockQuantity = _productStock[productID]!;
    if (productStockQuantity > 0) {
      _shoppingCart.addToCart(productID);
      decreaseProductStock(productID, 1);
    }
  }

  void removeFromShoppingCart(ProductID productToRemove) {
    if (_shoppingCart.canRemoveFromCart(productToRemove)) {
      _shoppingCart.removeFromCart(productToRemove);
      increaseProductStock(productToRemove, 1);
    }
  }

  int getProductCostByID(ProductID productID) {
    return _products
        .singleWhere((element) => element.getID() == productID)
        .getPrice()
        .toInt();
  }

// Setter and getters
  List<Product> getproducts() => _products;
  Map<ProductID, int> getProductStock() => _productStock;
  MoneyManager getMoneyManager() => _moneyManager;
  ShoppingCart getShoppingCart() => _shoppingCart;
}
