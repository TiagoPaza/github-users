class UserDetailObject {
  String login;
  int id;
  String avatarUrl;
  String siteAdmin;
  String htmlUrl;

  UserDetailObject(
    this.login,
    this.id,
    this.avatarUrl,
    this.siteAdmin,
    this.htmlUrl,
  );
}

class UsersData {
  int totalCount;
  bool incompleteResults;
  UserDetailObject? items;

  UsersData(this.totalCount, this.incompleteResults, this.items);
}

class HomeData {
  UsersData usersData;

  HomeData(this.usersData);
}

class HomeObject {
  HomeData data;

  HomeObject(this.data);
}
