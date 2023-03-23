import 'package:flutter/material.dart';
import '../../views/auth/screens/auth_screen.dart';
import '../../views/auth/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=TEXT EDITING CONTROLLER=-=-=-=-=-=-=-=-=-=-=-=-=-=-\\
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=BOOL VALUE=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  bool passwordVisible = false;

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=ENUM VALUE=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  Auth auth = Auth.signup;

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=FORM KEYS=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=SIGN IN=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  void signInUser(context) {
    if (signInFormKey.currentState!.validate()) {
      authService.singInUser(
          context: context,
          email: emailController.text,
          password: passwordController.text);
    }
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=SIGN UP=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  void signUpUser(context) {
    if (signUpFormKey.currentState!.validate()) {
      authService.signUpUser(
          context: context,
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text);
    }
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=PASSWORD VISIBILITY=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  void visibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=-=ENUMS=-=-=-=-=-=-=-=-=-=-=-=-=-=\\
  void authEnum() {
    if (auth == Auth.signup) {
      auth = Auth.signin;
      notifyListeners();
    } else {
      auth = Auth.signup;
      notifyListeners();
    }
  }
}
