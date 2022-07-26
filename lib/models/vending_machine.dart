import 'package:vending_machine/models/money_manager.dart';
import 'package:vending_machine/models/product.dart';

class VendingMachine {
  final List<Product> _productsInStock;
  MoneyManager _moneyManager;

  VendingMachine(this._productsInStock, this._moneyManager);
  VendingMachine.withStockValues()
      : _productsInStock = [
          Product(
              id: '1',
              imageUrl: 'null',
              title: 'Coca Cola',
              price: 500,
              availableQuantity: 10),
          Product(
              id: '2',
              imageUrl: 'null',
              title: 'Pepsi',
              price: 600,
              availableQuantity: 8),
          Product(
              id: '3',
              imageUrl: 'null',
              title: 'Fanta',
              price: 550,
              availableQuantity: 10),
          Product(
              id: '4',
              imageUrl: 'null',
              title: 'Sprite',
              price: 725,
              availableQuantity: 15),
        ],
        _moneyManager = MoneyManager.withDefaultCoinPool();

  void decreaseProductStock(ProductID id, int decreaseBy) {
    _productsInStock
        .singleWhere((product) => product.getID() == id)
        .decreaseAvailableQuantity(decreaseBy);
  }

// Setter and getters
  List<Product> getProductsInStock() => _productsInStock;
}
