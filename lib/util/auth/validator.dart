class AuthValidator {
  bool isEmailValid(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    String pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*$';
    return RegExp(pattern).hasMatch(password) && password.length >= 8;
    ;
  }
}