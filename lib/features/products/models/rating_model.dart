import 'package:json_annotation/json_annotation.dart';

part 'generated/rating_model.g.dart';

@JsonSerializable(createToJson: false)
class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}
