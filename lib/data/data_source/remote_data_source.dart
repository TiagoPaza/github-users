import 'package:github_users/data/network/app_api.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/data/responses/responses_parser.dart';
import 'package:retrofit/retrofit.dart';

abstract class RemoteDataSource {
  Future<UsersResponse> users(UsersRequest usersRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<UsersResponse> users(UsersRequest usersRequest) async {
    HttpResponse<dynamic> content =
        await _appServiceClient.users(usersRequest.name, usersRequest.page);

    content.data!['status_code'] = content.response.statusCode;

    if (!content.response.headers.isEmpty) {
      String? link = content.response.headers.value('link');

      if (link != null) {
        List<String> linkList = link.split(',');

        Iterable<String> findLast =
            linkList.where((element) => element.contains('rel="last"'));

        if (findLast.isNotEmpty) {
          String urlForLastPage = findLast.single;
          String? lastPage = RegExp(r'(\d+)').stringMatch(urlForLastPage);

          if (lastPage != null)
            content.data!['last_page'] = int.parse(lastPage);
        }
      }
    }

    ResponsesParser parser = ResponsesParser(content.data);

    return parser.parseInBackground();
    // return UsersResponse.fromJson(content.response.data!);
  }
}
