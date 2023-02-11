import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class UserRequest {
  @JsonKey(name: "name")
  String name;

  UserRequest(this.name);

// from json
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
