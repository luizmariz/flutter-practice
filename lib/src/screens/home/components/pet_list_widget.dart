import 'package:flutter/material.dart';
import 'package:flutter_practice/src/screens/home/components/pet_card_widget.dart';
import 'package:flutter_practice/src/shared/models/pet_model.dart';

class PetListWidget extends StatelessWidget {
  final List<Pet> pets;

  const PetListWidget({super.key, required this.pets});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (BuildContext context, int index) {
            return PetCardWidget(pet: pets[index]);
          },
        ));
  }
}
