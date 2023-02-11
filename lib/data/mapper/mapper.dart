import 'package:github_users/app/extensions.dart';
// to convert the response into a non nullable object (model)

import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/model/model.dart';

const EMPTY = "";
const HAS = false;
const VOID = null;
const ZERO = 0;

extension UserDetailResponseMapper on UserDetailResponse? {
  UserDetailResponse toDomain() {
    return UserDetailResponse(
      this?.login?.orEmpty(),
      this?.id?.orZero() ?? ZERO,
      this?.avatarUrl?.orEmpty(),
      this?.siteAdmin?.orHas(),
      this?.htmlUrl?.orEmpty(),
    );
  }
}

extension UsersResponseMapper on UsersResponse? {
  UsersResponse toDomain() {
    List<UserDetailResponse> mappedItems =
        (this?.items?.map((UserDetailResponse item) => item.toDomain()) ??
                Iterable.empty())
            .cast<UserDetailResponse>()
            .toList();

    return UsersResponse(this?.totalCount?.orZero() ?? ZERO,
        this?.incompleteResults?.orHas() ?? HAS, mappedItems);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    var data = HomeData(this?.data?.users?.orVoid() ?? VOID);

    return HomeObject(data);
  }
}
