import 'dart:convert';

class Rating {
  final String userId;
  final double rating;

  Rating({
    required this.userId,
    required this.rating,
  });
  Map<String, dynamic> tomap() {
    return {
      'userId': userId,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }
  String tojson() => json.encode(tomap());
  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}
