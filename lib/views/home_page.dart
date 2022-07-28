import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/models/product.dart';
import 'package:vending_machine/views/constants.dart';
import 'package:vending_machine/widgets/drinks.dart';

class Home extends GetView<VendingMachineController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const descTextStyle = TextStyle(
      color: Colors.black,
      // fontWeight: FontWeight.w800,
      // fontFamily: 'Marmalede',
      // letterSpacing: 0.5,
      fontSize: 20,
      // height: 2,
    );
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.all(30),
                margin: const EdgeInsets.all(23),
                color: color5,
                child: const Text(
                  'V E N D I N G   M A C H I N E',
                  style: TextStyle(
                      fontFamily: 'Marmalede',
                      fontSize: 60,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        DefaultTextStyle.merge(
          style: descTextStyle,
          child: Row(
            children: [
              const Drinks(),
              Container(
                // color: Colors.grey,
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height - 186,
                margin: const EdgeInsets.only(
                  bottom: 23,
                  right: 23,
                ),
                child: Column(
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
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // color: Colors.red,
                            margin: const EdgeInsets.only(
                                left: 23, top: 23, right: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'S O D A',
                                  style: TextStyle(
                                    // fontFamily: 'Marmalede',
                                    fontSize: 27,
                                  ),
                                ),
                                Text(
                                  'P R I C E',
                                  style: TextStyle(
                                    // fontFamily: 'Marmalede',
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
                ),
              ),
            ],
          ),
        )
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
