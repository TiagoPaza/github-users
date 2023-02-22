import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class UserDetailResponse {
  @JsonKey(name: "login")
  String? login;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "avatar_url")
  String? avatarUrl;
  @JsonKey(name: "site_admin")
  bool? siteAdmin;
  @JsonKey(name: "html_url")
  String? htmlUrl;

  UserDetailResponse(
    this.login,
    this.id,
    this.avatarUrl,
    this.siteAdmin,
    this.htmlUrl,
  );

// from json
  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UserDetailResponseToJson(this);
}

@JsonSerializable()
class UsersResponse extends BaseResponse {
  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "incomplete_results")
  bool? incompleteResults;
  @JsonKey(name: "items")
  List<UserDetailResponse>? items;

  UsersResponse(
    this.totalCount,
    this.lastPage,
    this.incompleteResults,
    this.items,
  );

// from json
  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'users')
  UsersResponse? users;

  HomeDataResponse(
    this.users,
  );

// toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

//fromJson
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse(this.data);

// toJson
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

//fromJson
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
