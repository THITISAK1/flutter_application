import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review_model.dart';

class ReviewService {
  final _db = FirebaseFirestore.instance;

  Stream<List<Review>> getReviews() {
    return _db
        .collection('reviews')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Review.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Future<void> addReview(Review review) async {
    final data = review.toMap();

    data['createdAt'] = FieldValue.serverTimestamp(); 

    await _db.collection('reviews').add(data);
  }

  Future<void> deleteReview(String id) async {
    await _db.collection('reviews').doc(id).delete();
  }
}
