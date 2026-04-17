class Review {
  final String id;
  final String title;
  final String description;
  final String image;

  Review({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Review.fromMap(String id, Map<String, dynamic> data) {
    return Review(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "image": image,
      "createdAt": DateTime.now(),
    };
  }
}