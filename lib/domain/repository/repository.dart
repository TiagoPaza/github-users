import 'package:dartz/dartz.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';

abstract class Repository {
  Future<Either<Failure, UsersResponse>> users(UsersRequest usersRequest);
}
