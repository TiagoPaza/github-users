import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_users/app/di.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/presentation/home/cubit/home_cubit.dart';
import 'package:github_users/presentation/home/widgets/users_detail_card.dart';
import 'package:github_users/presentation/resources/assets_manager.dart';
import 'package:github_users/presentation/resources/color_manager.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt.get<HomeCubit>(),
      builder: (BuildContext context, HomeState state) {
        return ScrollAppBar(
          elevation: 0.0,
          backgroundColor: ColorManager.background,
          controller: this._scrollController,
          centerTitle: false,
          title: state.showSearchState == ShowSearchState.TRUE
              ? _searchTextField()
              : Text("Encontre usúarios do GitHub"),
          backgroundGradient: LinearGradient(
            colors: [
              ColorManager.secondary,
              ColorManager.primary,
            ],
            stops: [0.0, 1.0],
          ),
          iconTheme: IconThemeData(color: ColorManager.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness:
                Brightness.light, // For Android (light icons)
            statusBarBrightness: Brightness.dark, // For iOS (light icons)
            statusBarColor: ColorManager.secondary,
          ),
          actions: <Widget>[
            if (state.showSearchState == ShowSearchState.TRUE)
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () async {
                  getIt.get<HomeCubit>().changeSearchState();
                },
              ),
            if (state.showSearchState == ShowSearchState.FALSE)
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  getIt.get<HomeCubit>().changeSearchState();
                },
              ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt.get<HomeCubit>(),
      builder: (BuildContext context, HomeState state) {
        if (state.usersContentState == UsersContentState.LOADING) {
          return Center(
            child: CircularProgressIndicator(color: ColorManager.white),
          );
        }

        if (state.usersContentState == UsersContentState.ERROR) {
          return Container(color: Colors.red);
        }

        if (state.usersContentState == UsersContentState.SUCCESS) {
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            controller: this._scrollController,
            itemCount: state.usersResponse!.items!.length,
            itemBuilder: (BuildContext context, int index) {
              UserDetailResponse userDetailResponse =
                  state.usersResponse!.items![index];

              return UserDetailCard(userDetailResponse: userDetailResponse);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16.0);
            },
          );
        }

        return Center(
          child: SvgPicture.asset(
            SvgAssets.logo,
            height: 138.0,
          ),
        );
      },
    );
  }

  Widget _searchTextField() {
    return TextField(
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Nome',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      onSubmitted: (String value) {
        getIt.get<HomeCubit>().getUser(name: value);
      },
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
