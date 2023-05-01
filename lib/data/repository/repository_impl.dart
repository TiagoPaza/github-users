import 'package:dartz/dartz.dart';
import 'package:github_users/data/data_source/local_data_source.dart';
import 'package:github_users/data/data_source/remote_data_source.dart';
import 'package:github_users/data/mapper/mapper.dart';
import 'package:github_users/data/network/error_handler.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/network/network_info.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UsersResponse>> users(
      UsersRequest usersRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final UsersResponse response =
            await _remoteDataSource.users(usersRequest);

        if (response.statusCode == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.statusCode ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
