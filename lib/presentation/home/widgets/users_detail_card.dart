import 'package:flutter/material.dart';
import 'package:github_users/data/responses/responses.dart';
import 'package:github_users/presentation/resources/color_manager.dart';
import 'package:github_users/presentation/resources/routes_manager.dart';

class UserDetailCard extends StatelessWidget {
  final UserDetailResponse _userDetailResponse;

  UserDetailCard({
    required UserDetailResponse userDetailResponse,
    Key? key,
  })  : this._userDetailResponse = userDetailResponse,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Material(
        color: ColorManager.secondary,
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              border: Border.all(
                width: 1.0,
                color: ColorManager.border,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: _boxDecoration(),
              child: Row(
                children: <Widget>[
                  if (this._userDetailResponse.avatarUrl != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        this._userDetailResponse.avatarUrl!,
                      ),
                    ),
                  const SizedBox(width: 8.0),
                  if (this._userDetailResponse.id != null &&
                      this._userDetailResponse.login != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this._userDetailResponse.id!.toString(),
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            this._userDetailResponse.login!,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          onTap: () async {
            await Navigator.pushNamed(
              context,
              Routes.userDetailsRoute,
              arguments: {
                "userDetailResponse": this._userDetailResponse,
              },
            );
          },
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    if (this._userDetailResponse.siteAdmin != null &&
        this._userDetailResponse.siteAdmin!) {
      return BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 20.0,
            color: ColorManager.primary,
          ),
        ),
      );
    }

    return BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 20.0,
          color: ColorManager.white,
        ),
      ),
    );
  }
}

// if (this._userDetailResponse.siteAdmin != null &&
//     this._userDetailResponse.siteAdmin!)
//   Container(
//     color: HexColor.fromHex("#0d1117"),
//     width: 18.0,
//     height: 72.0,
//   ),
