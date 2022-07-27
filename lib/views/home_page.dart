import 'package:flutter/material.dart';
import 'package:vending_machine/views/constants.dart';
import 'package:vending_machine/widgets/soda_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          children: [
            Expanded(
              child: Container(
                // color: Colors.black87,
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
                      margin: EdgeInsets.only(top: 30),
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
              ),
            ),
            Column(
              children: const [],
            )
          ],
        )
      ],
    );
  }
}
