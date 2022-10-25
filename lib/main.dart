import 'package:flutter/material.dart';

enum PetKind { cat, dog }

enum PetGenre { male, female }

class Pet {
  final String name;
  final String breed;
  final String imgUrl;
  final PetKind kind;
  final PetGenre genre;
  final String age;
  final double distance;

  const Pet(
      {required this.name,
      required this.breed,
      required this.imgUrl,
      required this.kind,
      required this.genre,
      required this.age,
      required this.distance});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Practice',
        theme: ThemeData(),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatelessWidget {
  static const List<Pet> pets = [
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

  const MyHomePage({super.key});

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
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(
                Icons.menu,
                color: Color(0xff747474),
                size: 28,
              ),
              centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Location",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffc1c1c1)),
                      )),
                  Text(
                    "Cameron St., Boston",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff545454),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/200")))
              ]),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (BuildContext context, int index) {
                var pet = pets[index];

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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18))),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                            child: Image.network(
                              pet.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: Text(pet.name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff2c2c2c))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(
                                          pet.breed,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff545454),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        '${pet.genre == PetGenre.female ? 'Female' : 'Male'}, ${pet.age}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffc1c1c1)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        size: 16,
                                        color: Color(0xffff6152),
                                      ),
                                      Text(
                                        '${pet.distance} kms away',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffc1c1c1)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Color(0xffc5c5c5),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
