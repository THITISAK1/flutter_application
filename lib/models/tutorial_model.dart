class Tutorial {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<dynamic> steps;
  final String image;

  Tutorial({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.steps,
    required this.image,
  });

  factory Tutorial.fromMap(String id, Map<String, dynamic> data) {
    return Tutorial(
      id: id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      steps: data['steps'] ?? [],
      image: data['image'] ?? '',
    );
  }
}