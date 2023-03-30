import 'dart:async';
import 'package:e_shoppie/views/admin/screen/admin_sceeen.dart';
import 'package:e_shoppie/views/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/bottom_bar.dart';
import '../user_provider.dart';

class SplashProvider extends ChangeNotifier {
  //=-=-=-=-=-=-=-=-=-=-=-=-=-=SPLASH VARIABLSE-=-=-=-=-=-=-=-=-=-=-=-=-\\
  double fontSize = 2;
  double textOpacity = 0.0;
  double loadSize = 0;

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=ANIMATION FUNCTIONS-=-=-=-=-=-=-=-=-=-=-=-=-\\
  textOpacityChange() {
    textOpacity = 1.0;
    notifyListeners();
  }

  fontSizeChange() {
    fontSize = 1.06;
    notifyListeners();
  }

  loadSizeChange() {
    loadSize = 70;
    notifyListeners();
  }

  //=-=-=-=-=-=-=-=-=-=-=-=-=-=AUTH CHECK-=-=-=-=-=-=-=-=-=-=-=-=-\\
  void splashTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      Provider.of<UserProvider>(context, listen: false).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context, listen: false).user.type ==
                  'user'
              ? Navigator.pushNamed(context, BottomBar.routeName)
              : Navigator.pushNamed(
                  context,
                  AdminScreen.routeName,
                )
          : Navigator.pushNamed(
              context,
              AuthScreen.routeName,
            );
      notifyListeners();
    });
  }
}
