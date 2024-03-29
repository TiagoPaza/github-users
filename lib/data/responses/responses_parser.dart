import 'dart:isolate';

import 'package:github_users/data/responses/responses.dart';

class ResponsesParser {
  final Map<String, dynamic> json;

  ResponsesParser(this.json);

  Future<UsersResponse> parseUsersInBackground() async {
    final ReceivePort p = ReceivePort();

    await Isolate.spawn(_parseUsersJson, p.sendPort);

    return await p.first;
  }

  Future<void> _parseUsersJson(SendPort p) async {
    Isolate.exit(p, UsersResponse.fromJson(json));
  }
}
