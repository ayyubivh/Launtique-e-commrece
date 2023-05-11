import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/views/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class IntroductionSliders extends StatefulWidget {
  const IntroductionSliders({super.key});

  @override
  State<IntroductionSliders> createState() => _IntroductionSlidersState();
}

class _IntroductionSlidersState extends State<IntroductionSliders> {
  int _pageIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kblack),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      minimumSize:
                          MaterialStateProperty.all(const Size(70, 30))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kwhite,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    itemCount: demoData.length,
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _pageIndex = value;
                      });
                    },
                    itemBuilder: (context, index) => SliderContent(
                      image: demoData[index].image,
                      title: demoData[index].title,
                      description: demoData[index].description,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        demoData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: onIndicate(isActive: index == _pageIndex),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: const EdgeInsets.only(right: 1),
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)))),
                          onPressed: () {
                            if (_pageIndex < demoData.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ));
                            }
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            size: 27,
                            color: kwhite,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget onIndicate({bool isActive = false}) {
    return isActive
        ? Container(
            height: 11,
            width: 32,
            decoration: BoxDecoration(
                color: GlobalVariables.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))))
        : Container(
            height: 4,
            width: 28,
            decoration: BoxDecoration(
                color: GlobalVariables.secondaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12)));
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.description,
    required this.image,
    required this.title,
  });
}

final List<Onboard> demoData = [
  Onboard(
      image: 'assets/images/sl1.jpg',
      title: 'Style with latest trends',
      description:
          'Start making latest trend with launtique for the huge discounts and start to be attracting others '),
  Onboard(
      image: 'assets/images/sl5.jpg',
      title: 'Change your personality',
      description:
          'Start making latest trend with launtique for the huge discounts and start to be attracting others '),
  Onboard(
      image: 'assets/images/sl3.jpg',
      title: "Let's make a new fashion",
      description:
          'Start making latest trend with launtique for the huge discounts and start to be attracting others '),
];

class SliderContent extends StatelessWidget {
  const SliderContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 450,
        ),
        kHeight10,
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer()
      ],
    );
  }
}
