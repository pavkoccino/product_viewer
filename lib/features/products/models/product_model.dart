import 'package:json_annotation/json_annotation.dart';
import 'package:product_viewer/features/products/models/rating_model.dart';

part 'generated/product_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
