import 'dart:isolate';

import 'package:github_users/data/responses/responses.dart';

class ResponsesParser {
  final Map<String, dynamic> json;

  ResponsesParser(this.json);

  Future<UsersResponse> parseInBackground() async {
    final p = ReceivePort();

    await Isolate.spawn(_parseJson, p.sendPort);

    return await p.first;
  }

  Future<void> _parseJson(SendPort p) async {
    Isolate.exit(p, UsersResponse.fromJson(json));
  }
}
