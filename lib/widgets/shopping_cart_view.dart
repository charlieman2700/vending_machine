import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/models/product.dart';

class ShoppingCartView extends GetView<VendingMachineController> {
  const ShoppingCartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 23),
          child: const Text(
            'S h o p p i n g   C a r t',
            style: TextStyle(
              fontFamily: 'Marmalede',
              fontSize: 48,
            ),
          ),
        ),
        const Divider(),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 23, top: 23, right: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'S O D A',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      'P R I C E',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        shoppingList()
      ],
    );
  }

  Obx shoppingList() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ...controller.productsInShoppingCart.entries.map((entrie) {
              return priceTextGenerator(entrie);
            }).toList(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                Text('₡${controller.totalShoppingCart.value.toString()}'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container priceTextGenerator(MapEntry<Product, int> entrie) {
    int quantity = entrie.value;
    int price = entrie.key.getPrice().toInt();
    String title = entrie.key.getTitle();
    entrie.key.getPrice();
    int totalCost = quantity * price;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text('$quantity x $title')),
          Text('₡$totalCost')
        ],
      ),
    );
  }
}
