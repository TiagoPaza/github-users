import 'package:dartz/dartz.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/repository/repository.dart';
import 'package:github_users/domain/usecase/base_usecase.dart';

class HomeUseCase extends BaseUseCase<UsersUseCaseInput, UsersResponse> {
  Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, UsersResponse>> execute(
    UsersUseCaseInput useCaseInput,
  ) async {
    return await this._repository.users(UserRequest(useCaseInput.name));
  }
}

class UsersUseCaseInput {
  String name;

  UsersUseCaseInput(this.name);
}
