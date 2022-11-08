import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/app_bar/main_app_bar_widget.dart';
import 'package:flutter_practice/src/screens/home/components/pet_list_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: const MainAppBarWidget(),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: const PetListWidget()),
    );
  }
}
