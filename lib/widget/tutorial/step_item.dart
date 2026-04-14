import 'package:flutter/material.dart';
import '../models/tutorial_model.dart';

class StepItem extends StatelessWidget {
  final StepModel step;

  const StepItem({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔢 Step Title
          Text(
            step.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          /// 🖼 Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              step.image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          /// 📄 Description
          Text(step.desc),
        ],
      ),
    );
  }
}