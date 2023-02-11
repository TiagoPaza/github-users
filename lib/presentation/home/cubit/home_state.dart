part of 'home_cubit.dart';

enum UsersContentState { DEFAULT, LOADING, SUCCESS, ERROR }

enum ShowSearchState { TRUE, FALSE }

class HomeState extends Equatable {
  final UsersContentState usersContentState;
  final ShowSearchState showSearchState;
  final UsersResponse? usersResponse;

  const HomeState({
    this.usersContentState = UsersContentState.DEFAULT,
    this.showSearchState = ShowSearchState.FALSE,
    this.usersResponse,
  });

  HomeState copyWith({
    UsersContentState? usersContentState,
    ShowSearchState? showSearchState,
    UsersResponse? usersResponse,
  }) {
    return HomeState(
      usersContentState: usersContentState ?? this.usersContentState,
      showSearchState: showSearchState ?? this.showSearchState,
      usersResponse: usersResponse ?? this.usersResponse,
    );
  }

  @override
  List<Object?> get props => [
        usersContentState,
        showSearchState,
        usersResponse,
      ];
}
