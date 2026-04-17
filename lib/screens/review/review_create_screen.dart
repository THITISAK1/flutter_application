import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/review_model.dart';
import '../../services/review_service.dart';

class ReviewCreateScreen extends StatefulWidget {
  const ReviewCreateScreen({super.key});

  @override
  State<ReviewCreateScreen> createState() => _ReviewCreateScreenState();
}

class _ReviewCreateScreenState extends State<ReviewCreateScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final service = ReviewService();
  File? imageFile;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  Future<String> uploadImage(File file) async {
    final ref = FirebaseStorage.instance.ref().child(
      'reviews/${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> submit() async {
    if (imageFile == null ||
        titleController.text.isEmpty ||
        descController.text.isEmpty) {
      return;
    }

    final imageUrl = await uploadImage(imageFile!);

    final review = Review(
      id: '',
      title: titleController.text,
      description: descController.text,
      image: imageUrl,
    );

    await service.addReview(review);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Review",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: imageFile == null
                    ? Center(child: Text("Tap to select image"))
                    : Image.file(imageFile!, fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.all(12), // ให้มี spacing ดีขึ้น
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: descController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Description",
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.all(12), // ให้มี spacing ดีขึ้น
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: submit, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
