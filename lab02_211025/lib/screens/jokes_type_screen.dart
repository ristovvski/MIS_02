import 'package:flutter/material.dart';
import '../services/joke_service.dart';
import '../widgets/joke_card.dart';
import 'jokes_list_screen.dart';
import 'random_joke_screen.dart';

class JokesTypeScreen extends StatelessWidget {
  final JokeService jokeService = JokeService();

  JokesTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke types'),
        backgroundColor: Colors.purple[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            },
          ),
        ],
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
        child: FutureBuilder<List<String>>(
          future: jokeService.getJokeTypes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load joke types'));
            } else {
              final jokeTypes = snapshot.data!;
              return ListView.builder(
                itemCount: jokeTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.deepPurple[50],
                      elevation: 12.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: JokeCard(
                        jokeType: jokeTypes[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  JokesListScreen(type: jokeTypes[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}