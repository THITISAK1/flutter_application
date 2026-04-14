import 'package:flutter/material.dart';
import '../../models/tutorial_model.dart';
import '../../widgets/step_item.dart';

class TutorialDetailScreen extends StatelessWidget {
  final Tutorial data;

  const TutorialDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: ListView(
        children: [

          /// 🖼 รูปใหญ่
          Image.network(
            data.image,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          /// 📄 Title + Description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(data.desc),
                const SizedBox(height: 8),

                /// 🎯 Level
                Text(
                  "Level: ${data.level}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          /// 🔢 Steps
          ...data.steps.map((step) {
            return StepItem(step: step);
          }).toList(),

          /// 💡 Tips
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "💡 Tips\n${data.tips.map((e) => "- $e").join("\n")}",
            ),
          ),

          /// ⚠️ Warning
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "⚠️ Warning\n${data.warnings.map((e) => "- $e").join("\n")}",
            ),
          ),
        ],
      ),
    );
  }
}