import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedDate;

  User({
    this.id,
    this.name,
    this.email,
    this.status,
    this.createdAt,
    this.updatedDate,
  });

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
