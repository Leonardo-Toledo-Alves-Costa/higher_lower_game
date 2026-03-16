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
  int score = 0;

  bool isLoading = true;
  bool isRevealed = false;

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
        isRevealed = false;
      });
    } catch (e) {
      print("Error to load data: $e");
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Game Over!"),
          content: Text("You scored $score points. Want to try again?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {
                  score = 0;
                  isLoading = true;
                });

                _loadShuffle();
              },
              child: const Text("PLAY AGAIN"),
            ),
          ],
        );
      },
    );
  }

  void _checkAnswer(bool choseHigher) async {
    int followersA = characters[0].followerCount;
    int followersB = characters[1].followerCount;

    bool isHigher = followersB > followersA;

    if (choseHigher == isHigher) {
      print("RIGHT!");

      setState(() {
        score += 1;
        isRevealed = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoading = true;
      });

      _loadShuffle();
    } else {
      print("WRONG!");
      _showGameOverDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text(
          score != 0 ? "Score: $score" : "Higher or Lower: The Game\n Who has more followers?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
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

                        const SizedBox(height: 20),
                        isRevealed
                            ? Text(
                                "${characters[1].followerCount} millions",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                    ),
                                    onPressed: () => _checkAnswer(true),
                                    child: const Text(
                                      "MORE",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        175,
                                        47,
                                        7,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                    ),
                                    onPressed: () => _checkAnswer(false),
                                    child: const Text(
                                      "LESS",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
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
