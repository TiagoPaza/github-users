import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/data/request/request.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/repository/repository.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  test('verifica se retorna UsersResponse', () async {
    final MockRepository mockHomeUseCase = MockRepository();
    final UsersRequest input = UsersRequest('name', 1);

    final UsersResponse usersResponse = UsersResponse(1, 1, false, []);
    final Either<Failure, UsersResponse> matcher = Right(usersResponse);

    when(() => mockHomeUseCase.users(input)).thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.users(input);

    expect(actual, matcher);
  });

  test('verifica a chamada ao UseCase', () async {
    final MockRepository mockHomeUseCase = MockRepository();
    final UsersRequest input = UsersRequest('name', 1);

    final UsersResponse usersResponse = UsersResponse(1, 1, false, []);
    final Either<Failure, UsersResponse> matcher = Right(usersResponse);

    when(() => mockHomeUseCase.users(input)).thenAnswer((_) async => matcher);

    final actual = await mockHomeUseCase.users(input);

    expect(actual, matcher);

    verify(() => mockHomeUseCase.users(input)).called(1);
  });
}
