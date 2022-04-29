import 'dart:convert';

class Animal {
  Animal(
      {required this.id,
      required this.name,
      required this.nameBribri,
      required this.description,
      required this.category,
      required this.token});

  int id;
  String name;
  String nameBribri;
  String description;
  int category;
  String token;
  String? animalId;

  get fullImgUrl {
    if (name != null) {
      return 'https://firebasestorage.googleapis.com/v0/b/diccionario-animales-en-bribri.appspot.com/o/animales%2F$name.png?alt=media&token=$token';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Animal.fromJson(String str) => Animal.fromMap(json.decode(str));

  factory Animal.fromMap(Map<String, dynamic> json) => Animal(
        id: json["id"],
        name: json["name"],
        nameBribri: json["nameBribri"],
        description: json["description"],
        category: json["category"],
        token: json["token"],
      );
}
