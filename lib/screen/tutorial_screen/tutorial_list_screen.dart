import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/tutorial_data.dart' ;
import 'tutorial_detail_screen.dart';

class TutorialListScreen extends StatelessWidget {
  final service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tutorials")),
      body: StreamBuilder<List<TutorialData>>(
        stream: service.getTutorials(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final tutorials = snapshot.data!;

          return ListView.builder(
            itemCount: tutorials.length,
            itemBuilder: (context, index) {
              final item = tutorials[index];

              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.content),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TutorialDetailScreen(data: item),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}