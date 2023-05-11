import 'package:e_shoppie/common/custom_button.dart';
import 'package:e_shoppie/common/custom_textfeild.dart';
import 'package:e_shoppie/common/nointernet.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/network/network_provider.dart';

enum Auth {
  signin,
  signup,
}

double screenHeight = 0;
double screenWidth = 0;

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: kwhite,
          body: SafeArea(
            child: SingleChildScrollView(child:
                Consumer2<AuthProvider, NetworkStatus>(
                    builder: (context, value, network, child) {
              return network == NetworkStatus.online
                  ? Stack(
                      children: [
                        ClipPath(
                          clipper: DrawClip1(),
                          child: Container(
                            height: size.height,
                            width: size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                const Color(0xff46ddbf).withOpacity(0.5),
                                const Color(0xff3088e2).withOpacity(0.5)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            )),
                          ),
                        ),
                        ClipPath(
                          clipper: DrawClip(),
                          child: Container(
                            height: size.height,
                            width: size.width,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Color(0xff46ddbf),
                                Color(0xff3088e2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            )),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight15,
                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Text(
                                  ' Welcome , \n Back.',
                                  style: TextStyle(
                                      color: kwhite,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                              kHeight15,
                              if (value.auth == Auth.signup)
                                Form(
                                  key: value.signUpFormKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(28.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height / 7.5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Sign Up ',
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Lato'),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 16.0),
                                              child: Text(
                                                '_________________',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            )
                                          ],
                                        ),
                                        CustomTextField(
                                          controller: value.nameController,
                                          hinTtext: 'Name',
                                        ),
                                        CustomTextField(
                                          controller: value.emailController,
                                          hinTtext: 'E-Mail',
                                        ),
                                        CustomTextField(
                                          pstext: value.passwordVisible,
                                          controller: value.passwordController,
                                          hinTtext: 'Password',
                                          suffix: IconButton(
                                            onPressed: () {
                                              value.visibility();
                                            },
                                            icon: value.passwordVisible
                                                ? Icon(
                                                    Icons.visibility,
                                                    color: kblack,
                                                  )
                                                : Icon(
                                                    Icons.visibility_off,
                                                    color: kblack,
                                                  ),
                                          ),
                                        ),
                                        kHeight15,
                                        CustomButton(
                                          color: GlobalVariables.primaryColor,
                                          text: 'SIGN UP',
                                          onTap: () {
                                            value.signUpUser(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    value.authEnum();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            value.authEnum();
                                          },
                                          child: value.auth == Auth.signup
                                              ? Row(
                                                  children: [
                                                    const Text(
                                                      "Don't have an account ?",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      '  Login ',
                                                      style: TextStyle(
                                                        color: kblack,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox()),
                                    ],
                                  ),
                                ),
                              ),
                              if (value.auth == Auth.signin)
                                Form(
                                  key: value.signInFormKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(28.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: size.height / 9),
                                        Row(
                                          children: [
                                            Text(
                                              'Login  ',
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Lato'),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 16.0),
                                              child: Text(
                                                '___________________',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            )
                                          ],
                                        ),
                                        CustomTextField(
                                          controller: value.emailController,
                                          hinTtext: 'E-Mail',
                                        ),
                                        CustomTextField(
                                          pstext: value.passwordVisible,
                                          controller: value.passwordController,
                                          hinTtext: 'Password',
                                          suffix: IconButton(
                                            onPressed: () {
                                              value.visibility();
                                            },
                                            icon: value.passwordVisible
                                                ? Icon(
                                                    Icons.visibility,
                                                    color: kblack,
                                                  )
                                                : Icon(
                                                    Icons.visibility_off,
                                                    color: kblack,
                                                  ),
                                          ),
                                        ),
                                        SizedBox(height: size.height / 12),
                                        CustomButton(
                                          color: GlobalVariables.primaryColor,
                                          text: 'SIGN IN',
                                          onTap: () {
                                            {
                                              value.signInUser(context);
                                            }
                                          },
                                        ),
                                        kHeight10,
                                        GestureDetector(
                                            onTap: () {
                                              value.authEnum();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Create new account ?",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  '  Sign Up  ',
                                                  style: TextStyle(
                                                    color: kblack,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                            ]),
                      ],
                    )
                  : const Connectionfailed();
            })),
          )),
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

class DrawClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width * 0.3, 50.0), radius: 200));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
