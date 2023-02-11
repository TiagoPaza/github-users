import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/presentation/resources/assets_manager.dart';
import 'package:github_users/presentation/resources/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsView extends StatelessWidget {
  // final UserDetailsCubit _cubit = getIt<UserDetailsCubit>();
  final UserDetailResponse _userDetailResponse;

  const UserDetailsView({
    required UserDetailResponse userDetailResponse,
    Key? key,
  })  : this._userDetailResponse = userDetailResponse,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ColorManager.secondary,
      centerTitle: true,
      title: Text("Detalhes do usuário"),
      iconTheme: IconThemeData(color: ColorManager.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.dark, // For iOS (light icons)
        statusBarColor: ColorManager.secondary,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            if (this._userDetailResponse.avatarUrl != null)
              Column(
                children: <Widget>[
                  Container(
                    width: 142.0,
                    height: 142.0,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      image: DecorationImage(
                        image:
                            NetworkImage(this._userDetailResponse.avatarUrl!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(142.0)),
                      border: Border.all(
                        color: ColorManager.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.0),
                ],
              ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Container(
                color: ColorManager.secondary,
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    if (this._userDetailResponse.id != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this._userDetailResponse.id!.toString(),
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          SvgPicture.asset(
                            SvgAssets.logo,
                            height: 26.0,
                            color: ColorManager.white,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            this._userDetailResponse.login!,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            if (this._userDetailResponse.htmlUrl != null)
              Column(
                children: <Widget>[
                  const SizedBox(height: 14.0),
                  InkWell(
                    onTap: () async {
                      Uri url = Uri.parse(this._userDetailResponse.htmlUrl!);

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Text(
                      "Página do usuário",
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
