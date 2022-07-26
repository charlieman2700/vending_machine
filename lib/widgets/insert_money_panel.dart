import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/views/constants.dart';
import 'package:vending_machine/widgets/add_coin.dart';

class InsertMoneyPanel extends GetView<VendingMachineController> {
  const InsertMoneyPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 23),
          child: const Text(
            'I n s e r t  M o n e y',
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
                      'C O I N',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      'Q U A N T I T Y',
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
        Container(
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 185,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(style: TextStyle(fontSize: 25), '₡500')),
                    Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Text(style: TextStyle(fontSize: 25), '₡100')),
                    Container(
                        margin: const EdgeInsets.only(top: 7),
                        child:
                            Text(style: const TextStyle(fontSize: 25), '₡50')),
                    Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Text(style: TextStyle(fontSize: 25), '₡25')),
                  ],
                ),
              ),
              Column(
                children: [
                  const AddCoin(
                    coinType: 500,
                  ),
                  const AddCoin(
                    coinType: 100,
                  ),
                  const AddCoin(
                    coinType: 50,
                  ),
                  const AddCoin(
                    coinType: 25,
                  ),
                  Obx(
                    () => Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Text(
                            'Total: ₡${controller.getTotalAmountPayment()}')),
                  ),
                  Container(
                    width: 90,
                    height: 40,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23), color: color1),
                    child: InkWell(
                      child: const Center(child: Text('Pay')),
                      onTap: () => controller.handlePaymentStates(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
