import 'package:github_users/data/data_source/local_data_source.dart';
import 'package:github_users/data/data_source/remote_data_source.dart';
import 'package:github_users/data/mapper/mapper.dart';
import 'package:github_users/data/network/error_handler.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/network/network_info.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UsersResponse>> users(UserRequest userRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.users(userRequest);

        if (response.status == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
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
