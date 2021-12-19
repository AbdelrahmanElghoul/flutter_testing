
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter/util/auth/validator.dart';

void main() {
  group('email validation', () {
    test("valid", () {
      expect(AuthValidator().isEmailValid("test@test.com"), true);
      expect(AuthValidator().isEmailValid("test@test.com.com"), true);
    });
    test("not valid", () {
      expect(AuthValidator().isEmailValid("test@test"), false);
      expect(AuthValidator().isEmailValid("test@test@test.com"), false);
      expect(AuthValidator().isEmailValid("testest.com"), false);
    });
  });
  group('password validation', () {
    test("valid", () {
      expect(AuthValidator().isPasswordValid('Valid 11'), true);
      expect(AuthValidator().isPasswordValid('11 Valid'), true);
    });

    test("not valid", () {
      expect(AuthValidator().isPasswordValid(''), false);
      expect(AuthValidator().isPasswordValid('ContainUpperAndLower'), false);
      expect(AuthValidator().isPasswordValid('111111111'), false);
      expect(AuthValidator().isPasswordValid('all lowercase'), false);
      expect(AuthValidator().isPasswordValid('ALL UPPERCASE'), false);
      expect(AuthValidator().isPasswordValid('1aA'), false);
    });
  });
}
