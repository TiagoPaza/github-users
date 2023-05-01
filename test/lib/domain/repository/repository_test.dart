import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/repository/repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/request/users_request_mock.dart';
import '../../../mocks/response/users_response_mock.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  test('verifica se retorna UsersResponse', () async {
    final MockRepository mockHomeUseCase = MockRepository();
    final Either<Failure, UsersResponse> matcher = Right(usersResponseMock);

    when(() => mockHomeUseCase.users(usersRequestMock))
        .thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.users(usersRequestMock);

    expect(actual, matcher);
  });

  test('verifica a chamada ao UseCase', () async {
    final MockRepository mockHomeUseCase = MockRepository();
    final Either<Failure, UsersResponse> matcher = Right(usersResponseMock);

    when(() => mockHomeUseCase.users(usersRequestMock))
        .thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.users(usersRequestMock);

    expect(actual, matcher);

    verify(() => mockHomeUseCase.users(usersRequestMock)).called(1);
  });
}
