import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_practice/src/shared/models/pet_model.dart';

class PetCardWidget extends StatelessWidget {
  final Pet pet;

  const PetCardWidget({super.key, required this.pet});

  int _getBackground() {
    List<int> colors = [
      0xfffee46b,
      0xff89d3d2,
      0xff7fc6e4,
      0xffffaa79,
      0xffb9d89e
    ];

    colors.shuffle();

    return colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  color: Color(_getBackground()),
                  borderRadius: const BorderRadius.all(Radius.circular(18))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: Image.network(
                  pet.imgUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 110,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(pet.name ?? "",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff2c2c2c))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              pet.breed ?? "",
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff545454),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            '${pet.genre == PetGenre.female ? 'Female' : 'Male'}, ${pet.age}',
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xffc1c1c1)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.locationDot,
                            size: 14,
                            color: Color(0xffff6152),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '${pet.distance} kms away',
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xffc1c1c1)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const FaIcon(FontAwesomeIcons.heart,
                  color: Color(0xffc5c5c5)),
            ),
          ],
        ),
      ),
    );
  }
}
