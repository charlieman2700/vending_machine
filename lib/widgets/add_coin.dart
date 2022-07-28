import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/views/constants.dart' as theme;

class AddCoin extends GetView<VendingMachineController> {
  final int coinType;
  const AddCoin({Key? key, required this.coinType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color buttonsColor = theme.color5;
    double buttonSize = 32;
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => {controller.removeCoinFromPayment(coinType)},
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
                        controller.payment[coinType].toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () => {controller.addCoinToPayment(coinType)},
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
