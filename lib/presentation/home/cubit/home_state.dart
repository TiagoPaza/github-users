part of 'home_cubit.dart';

enum UsersContentState { DEFAULT, LOADING, SUCCESS, ERROR }

enum ShowSearchState { TRUE, FALSE }

class HomeState extends Equatable {
  final UsersContentState usersContentState;
  final ShowSearchState showSearchState;
  final String? userName;
  final int currentPage;
  final UsersResponse? usersResponse;

  const HomeState({
    this.userName,
    this.currentPage = 1,
    this.usersContentState = UsersContentState.DEFAULT,
    this.showSearchState = ShowSearchState.FALSE,
    this.usersResponse,
  });

  HomeState copyWith({
    UsersContentState? usersContentState,
    ShowSearchState? showSearchState,
    String? userName,
    int currentPage = 1,
    UsersResponse? usersResponse,
  }) {
    return HomeState(
      usersContentState: usersContentState ?? this.usersContentState,
      showSearchState: showSearchState ?? this.showSearchState,
      userName: userName ?? this.userName,
      currentPage: currentPage,
      usersResponse: usersResponse ?? this.usersResponse,
    );
  }

  @override
  List<Object?> get props => [
        usersContentState,
        showSearchState,
        userName,
        currentPage,
        usersResponse,
      ];
}
