import 'package:flutter/material.dart';
import '../../services/review_service.dart';
import '../../models/review_model.dart';
import 'review_detail_screen.dart';
import 'review_create_screen.dart';

class ReviewScreen extends StatelessWidget {
  final service = ReviewService();

  ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Review",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),
        ),centerTitle: true,
      ),

      body: StreamBuilder<List<Review>>(
        stream: service.getReviews(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final reviews = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(12),
            itemCount: reviews.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {

              final review = reviews[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ReviewDetailScreen(review: review),
                    ),
                  );
                },

                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[900],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: [

                        /// 🔥 IMAGE
                        Expanded(
                          child: Image.network(
                            review.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),

                        /// 🔥 TITLE
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            review.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
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
          );
        },
      ),

      /// 🔥 ADD BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReviewCreateScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}