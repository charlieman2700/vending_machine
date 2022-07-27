import 'package:get/get.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/models/vending_machine.dart';

class VendingMachineController extends GetxController {
  final vendingMachine = VendingMachine.defaultProductStock().obs;

  int getProductAmountById(ProductID productId) {
    int stockQuantity = 0;
    var result = vendingMachine.value.getProductStock()[productId];
    if (result != null) {
      stockQuantity = result;
    }
    return stockQuantity;
  }
}
