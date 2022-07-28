import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';

import '../views/constants.dart' as theme;

class SodaInfo extends GetView<VendingMachineController> {
  final String imageUrl;
  final String productID;
  final String textName;
  final double width;
  final double height;

  const SodaInfo({
    super.key,
    required this.imageUrl,
    required this.textName,
    required this.productID,
    this.width = 129,
    this.height = 240,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonsColor = theme.color5;
    double buttonSize = 32;
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Image.asset(imageUrl,
              fit: BoxFit.cover, width: width, height: height),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textName,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '(₡${controller.priceOfProductByID(productID).toString()})',
                      style: const TextStyle(color: Colors.black, fontSize: 21),
                    ),
                  ],
                ),
                Divider(
                  height: theme.drinksTextDivider + 8,
                  indent: 24,
                  endIndent: 24,
                  thickness: 1.3,
                ),
                Obx(
                  () => Text(
                    'Available: ${controller.getProductAmountById(productID)}',
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                Divider(
                  height: theme.drinksTextDivider,
                  color: Colors.black87.withOpacity(0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () =>
                          {controller.removeProductFromShoppingCart(productID)},
                      child: Icon(
                        Icons.remove_circle,
                        color: buttonsColor,
                        size: buttonSize,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Obx(
                      () => Text(
                        controller
                            .quantityOfProductInShoppingCart(productID)
                            .toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () =>
                          {controller.addProductToShoppingCart(productID)},
                      child: Icon(
                        size: buttonSize,
                        Icons.add_circle,
                        color: buttonsColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
