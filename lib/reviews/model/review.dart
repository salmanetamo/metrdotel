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
    this.id,
    this.restaurantId,
    this.reviewerId,
    this.comment,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
