import 'package:github_users/data/mapper/mapper.dart';

extension NonNullElement on dynamic {
  dynamic orVoid() {
    if (this == null) {
      return VOID;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orHas() {
    if (this == null) {
      return HAS;
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}
