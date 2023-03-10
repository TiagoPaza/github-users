import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class UserRequest {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "page")
  int page;

  UserRequest(this.name, this.page);

// from json
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
