import 'package:dartz/dartz.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/responses/responses.dart';

import 'base_usecase.dart';

class UserDetailsUseCase
    extends BaseUseCase<UserDetailUseCaseInput, UserDetailResponse> {
  @override
  Future<Either<Failure, UserDetailResponse>> execute(
      UserDetailUseCaseInput input) async {
    return Right(input.userDetailResponse);
  }
}

class UserDetailUseCaseInput {
  UserDetailResponse userDetailResponse;

  UserDetailUseCaseInput(this.userDetailResponse);
}
