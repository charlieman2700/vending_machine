import 'package:flutter/material.dart';
import 'package:vending_machine/widgets/soda_info.dart';

class Drinks extends StatelessWidget {
  const Drinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsets.all(23),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SodaInfo(
                  imageUrl: 'assets/images/bottles/can/spriteCan.png',
                  textName: 'Sprite',
                  productID: '4'),
              SodaInfo(
                  imageUrl: 'assets/images/bottles/can/fantaCan.png',
                  textName: 'Fanta',
                  productID: '3'),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SodaInfo(
                  imageUrl: 'assets/images/bottles/can/cokeCan.png',
                  textName: 'Coca Cola',
                  productID: '1',
                ),
                SodaInfo(
                  imageUrl: 'assets/images/bottles/can/pepsiCan.png',
                  textName: 'Pepsi',
                  productID: '2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
