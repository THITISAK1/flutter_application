import 'package:flutter/material.dart';
import '../../models/tutorial_data.dart';

class TutorialDetailScreen extends StatelessWidget {
  final TutorialData data;

  const TutorialDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(data.content),
      ),
    );
  }
}