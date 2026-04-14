import 'package:flutter/material.dart';

class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  int leftScore = 0;
  int rightScore = 0;

  final int maxScore = 21;
  bool isGameOver = false;

  // ================= RESET =================
  void resetDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Reset Score?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                leftScore = 0;
                rightScore = 0;
                isGameOver = false;
              });
              Navigator.pop(context);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }

  // ================= CHECK WIN =================
  void checkWinner() {
    if (isGameOver) return;

    if (leftScore >= maxScore) {
      showWinner("Left Team");
    } else if (rightScore >= maxScore) {
      showWinner("Right Team");
    }
  }

  //  SHOW WIN 
  void showWinner(String team) {
    isGameOver = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text("$team Wins! 🏆"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetDialog();
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }

  //  ADD SCORE 
  void addLeftScore() {
    if (isGameOver) return;

    setState(() {
      leftScore++;
    });
    checkWinner();
  }

  void addRightScore() {
    if (isGameOver) return;

    setState(() {
      rightScore++;
    });
    checkWinner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                /// LEFT SIDE
                Expanded(
                  child: GestureDetector(
                    onTap: addLeftScore,
                    child: Container(
                      color: Colors.indigo,
                      child: Center(
                        child: Text(
                          '$leftScore',
                          style: TextStyle(
                            fontSize: 90,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// RIGHT SIDE
                Expanded(
                  child: GestureDetector(
                    onTap: addRightScore,
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          '$rightScore',
                          style: TextStyle(
                            fontSize: 90,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// RESET BUTTON
            Center(
              child: ElevatedButton(
                onPressed: resetDialog,
                child: Text('RESET'),
              ),
            ),

            /// Home BUTTON
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}