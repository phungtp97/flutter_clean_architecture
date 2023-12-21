import 'package:json_annotation/json_annotation.dart';
import '../converter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? name;
  final int? id;
  @EpochDateTimeConverter()
  final DateTime createdAt;

  UserModel({this.name, this.id, required this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
