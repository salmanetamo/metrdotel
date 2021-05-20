import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String id;
  final String restaurantId;
  final String reviewerId;
  final String comment;
  final int rating;

  Review({
    required this.id,
    required this.restaurantId,
    required this.reviewerId,
    required this.comment,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
