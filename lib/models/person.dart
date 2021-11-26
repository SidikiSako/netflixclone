import 'package:netflix_clone/services/api.dart';

class Person {
  final String name;
  final String? imageURL;

  Person({required this.name, this.imageURL});

  factory Person.fromJson(Map<String, dynamic> json) {
    final API api = API();
    return Person(
      name: json['name'],
      imageURL: json['profile_path'] != null
          ? api.baseImageURL + json['profile_path']
          : null,
    );
  }
}
