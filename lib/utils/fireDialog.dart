import 'package:flutter/material.dart';

import '../views/constants.dart';

Future<dynamic> fireDialog(context, String title, function,
    [String text = '']) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              Center(
                child: TextButton(
                    onPressed: function,
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(45)),
                      child: const Center(
                        child: Text(
                            style: TextStyle(fontSize: 23, color: Colors.white),
                            'Ok'),
                      ),
                    )),
              )
            ],
          ));
}
