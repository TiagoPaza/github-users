import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:github_users/app/di.dart';
import 'package:github_users/presentation/resources/language_manager.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: "assets/data/.env");

  await initAppModule();

  runApp(
    EasyLocalization(
      supportedLocales: [
        PORTUGUESE_LOCAL,
        ENGLISH_LOCAL,
      ],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp()),
    ),
  );
}
