import 'package:flutter/material.dart';
import 'scoreboard_screen.dart';

class ScoreSettingScreen extends StatefulWidget {
  const ScoreSettingScreen({super.key});

  @override
  State<ScoreSettingScreen> createState() => _ScoreSettingScreenState();
}

class _ScoreSettingScreenState extends State<ScoreSettingScreen> {
  final teamAController = TextEditingController();
  final teamBController = TextEditingController();
  final maxScoreController = TextEditingController(text: "21");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      appBar: AppBar(
        title:  Text("Game Setup",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 25),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 255, 253, 253),
        foregroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "Create Match",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 25),

            _inputField("Team A", Icons.people, teamAController),
            _inputField("Team B", Icons.people_outline, teamBController),
            _inputField(
              "Max Score",
              Icons.score,
              maxScoreController,
              isNumber: true,
            ),

            const Spacer(),

            _startButton(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool isNumber = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          labelText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  Widget _startButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ScoreboardScreen(
              teamA: teamAController.text.isEmpty ? "A" : teamAController.text,
              teamB: teamBController.text.isEmpty ? "B" : teamBController.text,
              maxScore: int.tryParse(maxScoreController.text) ?? 21,
            ),
          ),
        );
      },
      child: const Text(
        "Start Game",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
