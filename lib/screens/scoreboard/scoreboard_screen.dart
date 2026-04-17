import 'package:flutter/material.dart';

class ScoreboardScreen extends StatefulWidget {
  final String teamA;
  final String teamB;
  final int maxScore;

  const ScoreboardScreen({
    super.key,
    required this.teamA,
    required this.teamB,
    required this.maxScore,
  });

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  int scoreA = 0;
  int scoreB = 0;
  bool gameOver = false;

  void addScoreA() {
    if (gameOver) return;
    setState(() => scoreA++);
    checkWinner();
  }

  void addScoreB() {
    if (gameOver) return;
    setState(() => scoreB++);
    checkWinner();
  }

  void checkWinner() {
    if (scoreA >= widget.maxScore) {
      showWinner(widget.teamA);
    } else if (scoreB >= widget.maxScore) {
      showWinner(widget.teamB);
    }
  }

  void showWinner(String team) {
    gameOver = true;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("$team Wins! 🏆"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }

  void resetGame() {
    setState(() {
      scoreA = 0;
      scoreB = 0;
      gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🔵 LEFT TEAM
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: addScoreA,
                  child: Container(
                    color: Colors.indigo,
                    child: _scoreUI(widget.teamA, scoreA),
                  ),
                ),
              ),

              /// 🔴 RIGHT TEAM
              Expanded(
                child: GestureDetector(
                  onTap: addScoreB,
                  child: Container(
                    color: Colors.red,
                    child: _scoreUI(widget.teamB, scoreB),
                  ),
                ),
              ),
            ],
          ),

          /// 🔙 BACK BUTTON (ถูก UX)
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          /// 🔄 RESET
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: resetGame,
                child: const Text("RESET"),
              ),
            ),
          ),

          /// 🎯 MAX SCORE
          Positioned(
            top: 40,
            right: 20,
            child: Text(
              "To ${widget.maxScore}",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreUI(String team, int score) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          team,
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          score.toString(),
          style: const TextStyle(
            fontSize: 90,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}