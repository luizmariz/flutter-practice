import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/app_bar/main_app_bar_widget.dart';
import 'package:flutter_practice/src/screens/home/components/pet_list_widget.dart';
import 'package:flutter_practice/src/shared/models/pet_model.dart';

class HomeWidget extends StatelessWidget {
  final List<Pet> pets = [
    Pet(
        name: "Sparky",
        breed: "Golden Retriever",
        imgUrl:
            "https://www.pngall.com/wp-content/uploads/4/Golden-Retriever-Puppy-PNG-Download-Image.png",
        kind: PetKind.dog,
        genre: PetGenre.female,
        age: "8 months old",
        distance: 2.5),
    Pet(
        name: "Charlie",
        breed: "Boston Terrier",
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR25OVBKobKBQ4EYPXM2tnsv7TG7wiHTvjy15tVJfplESKmPxtpcLutSIqdoDSWK5tFUG0&usqp=CAU",
        kind: PetKind.dog,
        genre: PetGenre.male,
        age: "1.5 years old",
        distance: 2.6),
    Pet(
        name: "Max",
        breed: "Siberian Husky",
        imgUrl:
            "https://www.pngmart.com/files/8/Husky-PNG-Clipart-Background.png",
        kind: PetKind.dog,
        genre: PetGenre.male,
        age: "1 year old",
        distance: 2.9),
    Pet(
        name: "Dayse",
        breed: "Maltese",
        imgUrl:
            "https://img.freepik.com/fotos-premium/cachorro-maltes-sentado-sonhando-acordado-isolado-no-branco_191971-17967.jpg?w=2000",
        kind: PetKind.dog,
        genre: PetGenre.female,
        age: "7 months old",
        distance: 3.1),
  ];

  HomeWidget({super.key});

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
          child: PetListWidget(pets: pets)),
    );
  }
}
