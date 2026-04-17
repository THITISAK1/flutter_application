import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/tutorial_model.dart';
import 'tutorial_detail_screen.dart';

class TutorialListScreen extends StatelessWidget {
  final String category;
  final FirestoreService service = FirestoreService();

  TutorialListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey  , // 🔥 dark theme

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          category.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // 🔥 back button color
      ),

      body: StreamBuilder<List<Tutorial>>(
        stream: service.getByCategory(category),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final tutorials = snapshot.data!;

          if (tutorials.isEmpty) {
            return Center(
              child: Text(
                "No tutorials",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: tutorials.length,
            itemBuilder: (context, index) {
              final item = tutorials[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TutorialDetailScreen(data: item),
                    ),
                  );
                },

                child: Container(
                  margin: EdgeInsets.only(bottom: 14),
                  padding: EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row(
                    children: [
                      /// 🔥 IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 70,
                            height: 70,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            child: Icon(Icons.image, color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),

                      SizedBox(width: 12),

                      /// 🔥 TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              item.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// 🔥 ARROW
                      Icon(Icons.chevron_right, color: const Color.fromARGB(255, 0, 0, 0)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
