import 'package:meta/meta.dart';

@immutable
class Joke {
  final String setup;
  final String punchline;

  const Joke({required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
    setup: json['setup'] as String,
    punchline: json['punchline'] as String,
  );

  Map<String, dynamic> toJson() => {
    'setup': setup,
    'punchline': punchline,
  };
}
