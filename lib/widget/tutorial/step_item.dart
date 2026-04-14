import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final String step;

  const StepItem({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check),
      title: Text(step),
    );
  }
}