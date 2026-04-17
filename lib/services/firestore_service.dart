import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tutorial_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ ของเดิม (มีอยู่แล้วก็ใช้ต่อได้)
  Stream<List<Tutorial>> getAll() {
    return _db.collection('tutorials').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => Tutorial.fromMap(doc.id, doc.data()))
            .toList());
  }

  // 🔥 เพิ่มอันนี้
  Stream<List<Tutorial>> getByCategory(String category) {
    return _db
        .collection('tutorials')
        .where('category', isEqualTo: category)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Tutorial.fromMap(doc.id, doc.data()))
            .toList());
  }
}