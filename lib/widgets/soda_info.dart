import 'package:flutter/material.dart';

class SodaInfo extends StatelessWidget {
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
    return Column(
      children: [
        Image.asset(imageUrl, fit: BoxFit.cover, width: width, height: height),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: [
                Text(
                  textName,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
                Row(
                  children: [
                    Text(
                      'In Stock: 4',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
