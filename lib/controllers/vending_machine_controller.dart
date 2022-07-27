import 'package:get/get.dart';
import 'package:vending_machine/models/vending_machine.dart';

class VendingMachineController extends GetxController {
  final vendingMachine = VendingMachine.defaultProductStock().obs;
}
