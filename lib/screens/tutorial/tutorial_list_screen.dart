import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/tutorial_model.dart';
import 'tutorial_detail_screen.dart';

class TutorialListScreen extends StatelessWidget {
  final FirestoreService service = FirestoreService();

  TutorialListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Tutorial"),
        centerTitle: true,
      ),

      body: StreamBuilder<List<Tutorial>>(
        stream: service.getTutorials(),

        builder: (context, snapshot) {
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          // ❌ No data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No tutorials"));
          }

          // ✅ Data
          final tutorials = snapshot.data!;

          return ListView.builder(
            key: const PageStorageKey("tutorialList"),
            padding: const EdgeInsets.all(10),
            itemCount: tutorials.length,

            itemBuilder: (context, index) {
              final item = tutorials[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          TutorialDetailScreen(data: item),
                    ),
                  );
                },

                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // 🖼 IMAGE
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(14),
                        ),
                        child: Image.network(
                          item.image,
                          width: 100,
                          height: 90,
                          fit: BoxFit.cover,

                          // 🔥 กันพัง
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image, size: 60),

                          // 🔥 loading
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const SizedBox(
                              width: 100,
                              height: 90,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // 📄 TEXT
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                item.category,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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