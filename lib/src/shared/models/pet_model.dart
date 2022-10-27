enum PetKind { cat, dog }

enum PetGenre { male, female }

class Pet {
  String? name;
  String? breed;
  String? imgUrl;
  PetKind? kind;
  PetGenre? genre;
  String? age;
  double? distance;
  bool? favorite;
  List<String>? gallery;
  String? about;

  Pet(
      {this.name,
      this.breed,
      this.imgUrl,
      this.kind,
      this.genre,
      this.age,
      this.distance,
      this.favorite,
      this.gallery,
      this.about});

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    breed = json['breed'];
    imgUrl = json['imgUrl'];
    kind = json['kind'];
    genre = json['genre'];
    age = json['age'];
    distance = json['distance'];
    favorite = json['favorite'];
    gallery = json['gallery'].cast<String>();
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['breed'] = breed;
    data['imgUrl'] = imgUrl;
    data['kind'] = kind;
    data['genre'] = genre;
    data['age'] = age;
    data['distance'] = distance;
    data['favorite'] = favorite;
    data['gallery'] = gallery;
    data['about'] = about;

    return data;
  }
}
