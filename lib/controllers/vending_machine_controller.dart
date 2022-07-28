import 'package:get/get.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/vending_machine.dart';

// Este controlador implementa el getxController para administrar estados
// Su funcion principal es ser un puente entre el modelo y la vista
class VendingMachineController extends GetxController {
  final vendingMachine = VendingMachine.defaultProductStock().obs;
  final productsInShoppingCart = <Product, int>{}.obs;
  final totalShoppingCart = 0.obs;
  final payment = <int, int>{500: 0, 100: 0, 50: 0, 25: 0}.obs;

  bool isEnoughToPay() {
    int moneyReceived = getTotalAmountPayment();
    bool isEnoughToPay = vendingMachine.value
        .getMoneyManager()
        .isEnoughToPay(totalShoppingCart.value, moneyReceived);
    return isEnoughToPay;
  }

  bool canGiveChange() {
    return true;
  }

  void addCoinsToMachine() {
    payment.forEach((coinType, quantity) {
      vendingMachine.value.getMoneyManager().addCoins(coinType, quantity);
    });
  }

  void addCoinToPayment(int coinType) {
    payment[coinType] = payment[coinType]! + 1;
  }

  void removeCoinFromPayment(int coinType) {
    if (payment[coinType]! > 0) {
      payment[coinType] = payment[coinType]! - 1;
    }
  }

  int getTotalAmountPayment() {
    int totalAmount = 0;
    payment.forEach((coinType, quantity) {
      totalAmount += coinType * quantity;
    });
    return totalAmount;
  }

  int getProductAmountById(ProductID productID) {
    int stockQuantity = 0;
    var result = vendingMachine.value.getProductStock()[productID];
    if (result != null) {
      stockQuantity = result;
    }
    return stockQuantity;
  }

  List<int> getCoinTypes() {
    return vendingMachine.value.getCoinTypes();
  }

  void addProductToShoppingCart(ProductID productID) {
    var result = vendingMachine.value.getProductStock()[productID];
    if (result != null) {
      vendingMachine.value.addProductToShoppingCart(productID);
      _updateShoppingCart();
    }
  }

  void removeProductFromShoppingCart(ProductID productID) {
    var result = vendingMachine.value.getProductStock()[productID];
    if (result != null) {
      vendingMachine.value.removeFromShoppingCart(productID);
      _updateShoppingCart();
    }
  }

  int quantityOfProductInShoppingCart(ProductID productID) {
    return vendingMachine.value
        .getShoppingCart()
        .productQuantityInCart(productID);
  }

  int priceOfProductByID(ProductID productID) {
    return vendingMachine.value.getProductCostByID(productID);
  }

  Map<Product, int> getProductsOnShoppingCart() {
    return vendingMachine.value.getShoppingCart().getProductsInCart();
  }

  bool shoppingCartIsEmpty() {
    return vendingMachine.value.getShoppingCart().cartIsEmpy();
  }

  void _updateShoppingCart() {
    productsInShoppingCart.value =
        vendingMachine.value.getShoppingCart().getProductsInCart();
    totalShoppingCart.value =
        vendingMachine.value.getShoppingCart().getTotalPrice();
    vendingMachine.refresh();
  }
}
