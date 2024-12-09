import 'package:meta/meta.dart';

@immutable
class JokeType {
  final String name;

  const JokeType({required this.name});

  factory JokeType.fromJson(String json) => JokeType(name: json);

  String toJson() => name;
}
