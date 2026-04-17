import 'package:flutter/material.dart';
import 'tutorial_list_screen.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Warmup',
      'Cooldown',
      'Basic',
      'Rule',
    ];

    final categories = [
      'warmup',
      'cooldown',
      'basic',
      'rule',
    ];

    final images = [
      'assets/warmup.jpg',
      'assets/cooldown.png',
      'assets/basic.jpg',
      'assets/rule.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Tutorial',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: titles.length,
        itemBuilder: (context, index) {

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TutorialListScreen(
                    category: categories[index],
                  ),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 140,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [

                    /// 🔥 รูป
                    Positioned.fill(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// 🔥 Gradient
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),

                    /// 🔥 Text
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Text(
                        titles[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}