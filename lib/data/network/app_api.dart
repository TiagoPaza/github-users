import 'package:dio/dio.dart';
import 'package:github_users/app/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/search/users")
  Future<HttpResponse<dynamic>> users(
    @Query("q") String name,
    @Query("page") int page,
  );
}
