import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeState());

  getUser({required String name}) async {
    UsersUseCaseInput useCaseInput = UsersUseCaseInput(name);

    emit(state.copyWith(usersContentState: UsersContentState.LOADING));

    (await _homeUseCase.execute(useCaseInput)).fold((failure) {
      emit(state.copyWith(usersContentState: UsersContentState.ERROR));
    }, (UsersResponse usersResponse) {
      emit(
        state.copyWith(
          usersContentState: UsersContentState.SUCCESS,
          usersResponse: usersResponse,
        ),
      );
    });
  }

  changeSearchState() {
    if (state.showSearchState == ShowSearchState.TRUE) {
      emit(state.copyWith(showSearchState: ShowSearchState.FALSE));
    } else {
      emit(state.copyWith(showSearchState: ShowSearchState.TRUE));
    }
  }
}
