import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/data/network/failure.dart';
import 'package:github_users/domain/usecase/base_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseUseCase extends Mock implements BaseUseCase {}

void main() {
  test('verifica se retorna boolean', () async {
    final MockBaseUseCase mockBaseUseCase = MockBaseUseCase();
    final input = '';
    final output = true;
    final Either<Failure, bool> matcher = Right(output);

    when(() => mockBaseUseCase.execute(input)).thenAnswer((_) async => matcher);

    final actual = await mockBaseUseCase.execute(input);

    expect(actual, matcher);
  });

  test('verifica a chamada ao UseCase', () async {
    final MockBaseUseCase mockBaseUseCase = MockBaseUseCase();
    final input = '';
    final output = true;
    final Either<Failure, bool> matcher = Right(output);

    when(() => mockBaseUseCase.execute(input)).thenAnswer((_) async => matcher);

    final actual = await mockBaseUseCase.execute(input);

    expect(actual, matcher);

    verify(() => mockBaseUseCase.execute(input)).called(1);
  });
}
