import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tutorial_model.dart';

class FirestoreService {
  final collection =
      FirebaseFirestore.instance.collection('tutorials');

  Stream<List<Tutorial>> getTutorials() {
    return collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Tutorial.fromMap(doc.id, doc.data());
      }).toList();
    });
  }
}