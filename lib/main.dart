import 'package:flutter/material.dart';
import 'package:vending_machine/controllers/vending_machine_controller.dart';
import 'package:vending_machine/views/home_page.dart';
import 'package:get/get.dart';

void main() {
  Get.put(VendingMachineController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vending Machine',
      home: Scaffold(
        body: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
