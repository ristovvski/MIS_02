import 'package:flutter/material.dart';
import '../services/joke_service.dart';
import '../models/jokes.dart';

class RandomJokeScreen extends StatelessWidget {
  final JokeService jokeService = JokeService();

  RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke of the Day'),
        backgroundColor: Colors.purple[200],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-vector/gradient-geometric-pattern-background_23-2149120340.jpg',
            ),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: FutureBuilder<Joke>(
          future: jokeService.getRandomJoke(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load random joke'));
            } else {
              final joke = snapshot.data!;
              return Center(
                child: Card(
                  color: Colors.deepPurple[50],
                  elevation: 12.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          joke.setup,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          joke.punchline,
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}