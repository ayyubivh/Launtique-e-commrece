import 'package:e_shoppie/common/custom_button.dart';
import 'package:e_shoppie/common/custom_textfeild.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

enum Auth {
  signin,
  signup,
}

bool passwordVisible = false;
double screenHeight = 0;
double screenWidth = 0;

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.singInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: DrawClip1(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff46ddbf).withOpacity(0.5),
                    Color(0xff3088e2).withOpacity(0.5)
                  ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
                ),
              ),
              ClipPath(
                clipper: DrawClip(),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff46ddbf), Color(0xff3088e2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft)),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                if (_auth == Auth.signup)
                  Form(
                    key: _signUpFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  '_________________',
                                  style: TextStyle(fontSize: 30),
                                ),
                              )
                            ],
                          ),
                          CustomTextField(
                            controller: _nameController,
                            hinTtext: 'Name',
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hinTtext: 'E-Mail',
                          ),
                          CustomTextField(
                            pstext: passwordVisible,
                            controller: _passwordController,
                            hinTtext: 'Password',
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: passwordVisible
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
                            color: GlobalVariables.secondaryColor,
                            text: 'SIGN UP',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      setState(() {
                        _auth = Auth.signin;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _auth = Auth.signin;
                              });
                            },
                            child: _auth == Auth.signup
                                ? Row(
                                    children: [
                                      const Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '  Login ',
                                        style: TextStyle(
                                          color: kblack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox()),
                      ],
                    ),
                  ),
                ),
                if (_auth == Auth.signin)
                  Form(
                    key: _signInFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  '___________________',
                                  style: TextStyle(fontSize: 30),
                                ),
                              )
                            ],
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hinTtext: 'E-Mail',
                          ),
                          CustomTextField(
                            pstext: passwordVisible,
                            controller: _passwordController,
                            hinTtext: 'Password',
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: passwordVisible
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
                          SizedBox(height: size.height / 8),
                          CustomButton(
                            color: GlobalVariables.secondaryColor,
                            text: 'SIGN IN',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                          ),
                          kHeight10,
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _auth = Auth.signup;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ),
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
    // TODO: implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 50.0), radius: 150));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width * 0.3, 50.0), radius: 200));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
