part of 'user_details_cubit.dart';

class UserDetailsState extends Equatable {
  final UserDetailResponse? userDetailResponse;

  const UserDetailsState({this.userDetailResponse});

  UserDetailsState copyWith({UserDetailResponse? userDetailResponse}) {
    return UserDetailsState(
      userDetailResponse: userDetailResponse ?? this.userDetailResponse,
    );
  }

  @override
  List<Object?> get props => [userDetailResponse];
}
