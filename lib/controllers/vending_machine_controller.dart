import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/vending_machine.dart';
import 'package:vending_machine/utils/fireDialog.dart';

// Este controlador implementa el getxController para administrar estados
// Su funcion principal es ser un puente entre el modelo y la vista
class VendingMachineController extends GetxController {
  final vendingMachine = VendingMachine.defaultProductStock().obs;
  final productsInShoppingCart = <Product, int>{}.obs;
  final totalShoppingCart = 0.obs;
  final payment = <int, int>{500: 0, 100: 0, 50: 0, 25: 0}.obs;

  void handlePaymentStates(context) {
    String textMessage = '';
    if ((vendingMachine.value.getShoppingCart().getTotalPrice()) == 0) {
      fireDialog(context, 'Empty cart', () => Navigator.of(context).pop());
    } else if (isEnoughToPay()) {
      addCoinsToMachine();
      if (canGiveChange()) {
        textMessage = 'Transaction Completed:\nEnjoy your Order:\n';
        productsInShoppingCart.forEach((key, value) {
          textMessage += '${key.getTitle()} x $value\n';
          vendingMachine.value.decreaseProductStock(key.getID(), value);
        });

        int change = calculatePaymentAmount() - totalShoppingCart.value;
        textMessage +=
            'Change:${calculatePaymentAmount()} -  ${totalShoppingCart.value} = $change \n';
        vendingMachine.value
            .getMoneyManager()
            .calculateCoinsForChange(
                (calculatePaymentAmount() - totalShoppingCart.value))
            .forEach((key, value) {
          textMessage += '$key x $value\n';
        });
        fireDialog(context, 'Order Completed',
            () => Navigator.of(context).pop(), textMessage);
        completeOrder();
      } else {
        getCoinsOut();
        fireDialog(context, 'Error:', () => Navigator.of(context).pop(),
            'Not enough change, resetting order');
      }
    } else {
      textMessage = 'Not enough coins received';
      fireDialog(
          context, 'Error:', () => Navigator.of(context).pop(), textMessage);
    }
  }

  void completeOrder() {
    vendingMachine.value.setShoppingCartInZero();
    _updateShoppingCart();
    _resetPayment();
    totalShoppingCart.value = 0;
    vendingMachine.refresh();
  }

  void getCoinsOut() {
    payment.forEach((coinType, quantity) {
      vendingMachine.value.getMoneyManager().substractCoins(coinType, quantity);
    });
  }

  void _resetPayment() {
    payment.forEach((key, value) {
      payment[key] = 0;
    });
  }

  void setShoppingCartInZero() {
    vendingMachine.value.setShoppingCartInZero();
    _updateShoppingCart();
  }

  void resetShoppingCart() {
    vendingMachine.value.resetShoppingCart();
    _resetPayment();
    _updateShoppingCart();
    totalShoppingCart.value = 0;
  }

  bool isEnoughToPay() {
    int moneyReceived = getTotalAmountPayment();
    bool isEnoughToPay = vendingMachine.value.getMoneyManager().isEnoughToPay(
        vendingMachine.value.getShoppingCart().getTotalPrice(), moneyReceived);

    return isEnoughToPay;
  }

  bool canGiveChange() {
    return vendingMachine.value
        .getMoneyManager()
        .canReturnChange(totalShoppingCart.value);
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
    if (result != null || result != 0) {
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
    vendingMachine.refresh();
    productsInShoppingCart.value =
        vendingMachine.value.getShoppingCart().getProductsInCart();
    totalShoppingCart.value =
        vendingMachine.value.getShoppingCart().getTotalPrice();
    vendingMachine.refresh();
  }

  int calculatePaymentAmount() {
    int paymentCalculation = 0;
    payment.forEach((key, value) {
      paymentCalculation += key * value;
    });
    return paymentCalculation;
  }
}
