import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tutorial_data.dart';

class FirestoreService {
  final _tutorial = FirebaseFirestore.instance.collection('tutorial');

  // ดึงทั้งหมด
  Stream<List<TutorialData>> getTutorials() {
    return _tutorial.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TutorialData.fromMap(doc.id, doc.data());
      }).toList();
    });
  }

  // เพิ่ม tutorial
  Future<void> addTutorial(String title, String content) {
    return _tutorial.add({
      'title': title,
      'content': content,
    });
  }
}