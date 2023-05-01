import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/usecase/home_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/response/users_response_mock.dart';
import '../../../mocks/usecase/users_usecase_input_mock.dart';

class MockHomeUseCase extends Mock implements HomeUseCase {}

void main() {
  test('verifica se retorna UsersResponse', () async {
    final MockHomeUseCase mockHomeUseCase = MockHomeUseCase();
    final Either<Failure, UsersResponse> matcher = Right(usersResponseMock);

    when(() => mockHomeUseCase.execute(usersUseCaseInputMock))
        .thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.execute(usersUseCaseInputMock);

    expect(actual, matcher);
  });

  test('verifica a chamada ao UseCase', () async {
    final MockHomeUseCase mockHomeUseCase = MockHomeUseCase();
    final Either<Failure, UsersResponse> matcher = Right(usersResponseMock);

    when(() => mockHomeUseCase.execute(usersUseCaseInputMock))
        .thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.execute(usersUseCaseInputMock);

    expect(actual, matcher);

    verify(() => mockHomeUseCase.execute(usersUseCaseInputMock)).called(1);
  });
}
