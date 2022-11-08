enum PetKind {
  cat,
  dog;

  static PetKind fromJson(String json) => values.byName(json);
  String toJson() => name;
}

enum PetGenre {
  female,
  male;

  static PetGenre fromJson(String json) => values.byName(json);
  String toJson() => name;
}

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
    kind = PetKind.fromJson(json['kind'].toString());
    genre = PetGenre.fromJson(json['genre'].toString());
    age = json['age'];
    distance = json['distance'];
    favorite = json['favorite'];
    gallery = json['gallery']?.cast<String>();
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['breed'] = breed;
    data['imgUrl'] = imgUrl;
    data['kind'] = kind?.toJson();
    data['genre'] = genre?.toJson();
    data['age'] = age;
    data['distance'] = distance;
    data['favorite'] = favorite;
    data['gallery'] = gallery;
    data['about'] = about;

    return data;
  }
}
