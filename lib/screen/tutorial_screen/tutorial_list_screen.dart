import 'package:flutter/material.dart';
import 'package:flutter_application/widget/tutorial/tutorial_card.dart';
import 'tutorial_detail_screen.dart';

class TutorialListScreen extends StatelessWidget {
  TutorialListScreen({super.key});

  final tutorials = [
    {
      "title": "Smash",
      "desc": "ตีให้แรงและเร็ว",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "Clear",
      "desc": "ตีไปท้ายสนาม",
      "image": "https://via.placeholder.com/300",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial")),
      body: ListView.builder(
        itemCount: tutorials.length,
        itemBuilder: (context, index) {
          final item = tutorials[index];

          return TutorialCard(
            title: item['title']!,
            desc: item['desc']!,
            image: item['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TutorialDetailScreen(title: item['title']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
