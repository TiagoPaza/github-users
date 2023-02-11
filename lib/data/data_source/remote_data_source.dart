import 'package:github_users/data/network/app_api.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<UsersResponse> users(UserRequest userRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<UsersResponse> users(UserRequest userRequest) async {
    return await _appServiceClient.users(userRequest.name);
  }
}
