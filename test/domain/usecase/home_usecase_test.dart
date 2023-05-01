import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/usecase/home_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeUseCase extends Mock implements HomeUseCase {}

void main() {
  test('verifica se retorna UsersResponse', () async {
    final MockHomeUseCase mockHomeUseCase = MockHomeUseCase();
    final UsersUseCaseInput input = UsersUseCaseInput('name', 1);

    final UsersResponse usersResponse = UsersResponse(1, 1, false, []);
    final Either<Failure, UsersResponse> matcher = Right(usersResponse);

    when(() => mockHomeUseCase.execute(input)).thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.execute(input);

    expect(actual, matcher);
  });

  test('verifica a chamada ao UseCase', () async {
    final MockHomeUseCase mockHomeUseCase = MockHomeUseCase();
    final UsersUseCaseInput input = UsersUseCaseInput('name', 1);

    final UsersResponse usersResponse = UsersResponse(1, 1, false, []);
    final Either<Failure, UsersResponse> matcher = Right(usersResponse);

    when(() => mockHomeUseCase.execute(input)).thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.execute(input);

    expect(actual, matcher);

    verify(() => mockHomeUseCase.execute(input)).called(1);
  });
}
