import 'dart:async';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../providers/introprovider/splash_provider.dart';
import '../auth/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation1;
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();

    authService.getUserData(context);

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        Provider.of<SplashProvider>(context, listen: false).textOpacityChange();
      });

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Provider.of<SplashProvider>(context, listen: false).fontSizeChange();
    });
    Timer(const Duration(seconds: 4), () {
      Provider.of<SplashProvider>(context, listen: false).loadSizeChange();
    });
    Timer(const Duration(seconds: 2), () {
      Provider.of<SplashProvider>(context, listen: false).splashTimer(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<SplashProvider>(
        builder: (context, value, child) => Stack(
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / value.fontSize,
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: value.textOpacity,
                  child: Text(
                    'LAUNTIQUE',
                    style: TextStyle(
                      color: GlobalVariables.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              top: 0,
              // left: 0,
              right: 165,
              child: LoadingAnimationWidget.prograssiveDots(
                color: GlobalVariables.primaryColor,
                size: value.loadSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
