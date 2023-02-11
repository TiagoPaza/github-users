import 'package:github_users/app/constant.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/search/users")
  Future<UsersResponse> users(
    @Query("q") String name,
  );
}
