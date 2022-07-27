import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';

import '../views/constants.dart';

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
    Color buttonsColor = color5;
    return Column(
      children: [
        Image.asset(imageUrl, fit: BoxFit.cover, width: width, height: height),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                textName,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              Obx(
                () => Text(
                  'In Stock: ${controller.getProductAmountById(productID)}',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.add_circle,
                    color: buttonsColor,
                  ),
                  Icon(
                    Icons.remove_circle,
                    color: buttonsColor,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
