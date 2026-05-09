import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewEntity {
  final String userName;
  final double rating;
  final String comment;
  final DateTime createdAt;

  ReviewEntity({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

factory ReviewEntity.fromMap(Map<String, dynamic> data) {
  final timestamp = data['createdAt'];
  return ReviewEntity(
    userName: data['userName'] ?? 'Unknown User',
    rating: (data['rating'] ?? 0).toDouble(),
    comment: data['comment'] ?? '',
    createdAt: timestamp is Timestamp ? timestamp.toDate() : DateTime.now(),
  );
}

}
