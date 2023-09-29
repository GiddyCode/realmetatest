import 'app_strings.dart';

class ValidationService {
  bool validateEmail(email) {
    RegExp exp = RegExp(AppStrings.emailPattern.trim());
    if (!exp.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }}