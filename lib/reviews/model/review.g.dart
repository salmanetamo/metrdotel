// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    id: json['id'] as String,
    restaurantId: json['restaurantId'] as String,
    reviewerId: json['reviewerId'] as String,
    comment: json['comment'] as String,
    rating: json['rating'] as int,
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'reviewerId': instance.reviewerId,
      'comment': instance.comment,
      'rating': instance.rating,
    };
