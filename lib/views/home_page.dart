import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/views/constants.dart';

import 'package:vending_machine/widgets/drinks.dart';
import 'package:vending_machine/widgets/insert_money_panel.dart';
import 'package:vending_machine/widgets/shopping_cart_view.dart';

class Home extends GetView<VendingMachineController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
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
              const ShoppingCartView(),
              const InsertMoneyPanel(),
            ],
          ),
        )
      ],
    );
  }
}
