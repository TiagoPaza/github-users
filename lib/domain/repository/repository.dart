import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, UsersResponse>> users(UserRequest userRequest);
}
