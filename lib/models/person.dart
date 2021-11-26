import 'package:netflix_clone/services/api.dart';

class Person {
  final String name;
  final String? imageURL;
  final String characterName;

  Person({required this.name, this.imageURL, required this.characterName});

  factory Person.fromJson(Map<String, dynamic> json) {
    final API api = API();
    return Person(
      name: json['name'],
      characterName: json['character'],
      imageURL: json['profile_path'] != null
          ? api.baseImageURL + json['profile_path']
          : null,
    );
  }
}
