import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class UsersRequest {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "page")
  int page;

  UsersRequest(this.name, this.page);

// from json
  factory UsersRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersRequestFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UsersRequestToJson(this);
}
