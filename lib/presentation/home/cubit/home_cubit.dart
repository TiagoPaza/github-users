import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/domain/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeState());

  getUsers({String? name}) async {
    UsersUseCaseInput useCaseInput;
    int nextPage = state.currentPage + 1;

    if (name != null) {
      emit(
        HomeState(
          userName: name,
          usersContentState: UsersContentState.LOADING,
        ),
      );

      useCaseInput = UsersUseCaseInput(state.userName!, state.currentPage);
    } else {
      if (state.currentPage <= state.usersResponse!.lastPage!) {
        emit(state.copyWith(usersContentState: UsersContentState.LOADING));

        useCaseInput = UsersUseCaseInput(state.userName!, nextPage);
      } else {
        return;
      }
    }

    (await _homeUseCase.execute(useCaseInput)).fold((failure) {
      emit(
        state.copyWith(
          usersContentState: UsersContentState.ERROR,
          usersResponse: null,
        ),
      );
    }, (UsersResponse usersResponse) {
      if (state.usersResponse != null && usersResponse.items != null) {
        if (usersResponse.items!.length <= 100) {
          state.usersResponse!.items!.addAll(usersResponse.items!);

          usersResponse = state.usersResponse!;
        }
      }

      emit(
        state.copyWith(
          usersContentState: UsersContentState.SUCCESS,
          usersResponse: usersResponse,
          currentPage: nextPage,
        ),
      );

      print("CURRENT AFTER RESPONSE: ${state.currentPage}");
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
