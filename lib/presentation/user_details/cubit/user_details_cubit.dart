import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/usecase/user_details_usecase.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserDetailsUseCase userDetailsUseCase;

  UserDetailsCubit(this.userDetailsUseCase) : super(UserDetailsState());
}
