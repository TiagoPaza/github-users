import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_users/presentation/home/widgets/users_detail_card.dart';
import 'package:github_users/presentation/resources/routes_manager.dart';
import 'package:github_users/presentation/user_details/user_details_view.dart';

import '../../../mocks/response/user_detail_response_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('user detail card test', (WidgetTester widgetTester) async {
    await _createWidget(widgetTester: widgetTester);

    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text && widget.data == 'github',
        description: 'test if login is github',
      ),
      findsOneWidget,
    );

    await widgetTester.tap(find.byType(InkWell));
  });
}

Future<void> _createWidget({required WidgetTester widgetTester}) async {
  await widgetTester.pumpWidget(
    MaterialApp(
      routes: {
        Routes.userDetailsRoute: (context) => UserDetailsView(
              userDetailResponse: userDetailResponseMock,
            ),
      },
      home: Scaffold(
        body: UserDetailCard(userDetailResponse: userDetailResponseMock),
      ),
    ),
  );

  await widgetTester.pump();
}
