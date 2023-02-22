import 'package:github_users/data/network/app_api.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';

abstract class RemoteDataSource {
  Future<UsersResponse> users(UserRequest userRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<UsersResponse> users(UserRequest userRequest) async {
    HttpResponse<dynamic> content =
        await _appServiceClient.users(userRequest.name, userRequest.page);

    content.data!['status_code'] = content.response.statusCode;

    if (!content.response.headers.isEmpty) {
      String? link = content.response.headers.value('link');

      if (link != null) {
        List<String> linkList = link.split(',');
        String? lastPage = RegExp(r'(\d+)').stringMatch(linkList.last);

        if (lastPage != null) content.data!['last_page'] = int.parse(lastPage);
      }
    }

    return UsersResponse.fromJson(content.response.data!);
  }
}
