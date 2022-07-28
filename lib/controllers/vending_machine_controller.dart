import 'package:get/get.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/vending_machine.dart';

class VendingMachineController extends GetxController {
  final vendingMachine = VendingMachine.defaultProductStock().obs;
  final productsInShoppingCart = <Product, int>{}.obs;
  final totalShoppingCart = 0.obs;

  int getProductAmountById(ProductID productID) {
    int stockQuantity = 0;
    var result = vendingMachine.value.getProductStock()[productID];
    if (result != null) {
      stockQuantity = result;
    }
    return stockQuantity;
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
