import 'package:flutter/material.dart';
import 'package:higher_lower_frontend/models/character.dart';
import 'package:higher_lower_frontend/services/api_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Character> characters = [];

  bool isLoading = true;

  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadShuffle();
  }

  Future<void> _loadShuffle() async {
    try {
      final dataReady = await _apiService.fetchShuffle();

      setState(() {
        characters = dataReady;
        isLoading = false;
      });
    } catch (e) {
      print("Error to load data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Higher or Lower: The Game"),
        backgroundColor: Colors.purple,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : //Card A
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          characters[0].name,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),

                        // 2. A descrição do Personagem A
                        Text(
                          characters[0].description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),

                        Text(
                          "from ${characters[0].country}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          '${characters[0].followerCount} millions',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //card B
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.redAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          characters[1].name,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),

                        // 2. A descrição do Personagem A
                        Text(
                          characters[1].description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),

                        Text(
                          "from ${characters[0].country}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'has MORE or LESS followers?',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
