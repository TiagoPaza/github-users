import 'package:github_users/presentation/resources/assets_manager.dart';
import 'package:github_users/presentation/resources/color_manager.dart';
import 'package:github_users/presentation/resources/routes_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('app resources', () {
    test('splash route', () {
      expect(Routes.splashRoute, '/');
    });
    test('home route', () {
      expect(Routes.homeRoute, '/home');
    });
    test('user details route', () {
      expect(Routes.userDetailsRoute, '/userDetails');
    });
    test('primary color', () {
      expect(ColorManager.primary, HexColor.fromHex("#161b22"));
    });
    test('secondary color', () {
      expect(ColorManager.secondary, HexColor.fromHex("#0d1117"));
    });
    test('background color', () {
      expect(ColorManager.background, HexColor.fromHex("#010409"));
    });
    test('logo asset', () {
      expect(SvgAssets.logo, 'assets/svgs/github.svg');
    });
  });
}
