import 'package:flutter/material.dart';
import 'package:flutter_application/screens/scoreboard/score_setting_screen.dart';
import 'tutorial/tutorial_screen.dart';
import 'review/review_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    TutorialScreen(),
    ReviewScreen(),
    ScoreSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// 🔥 เปลี่ยนหน้าแบบ smooth + จำ state
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      /// 🔥 BottomNav สวย
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,

            selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
            unselectedItemColor: Colors.grey,

            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Tutorial",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rate_review),
                label: "Review",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_score),
                label: "Score",
              ),
            ],
          ),
        ),
      ),
    );
  }
}