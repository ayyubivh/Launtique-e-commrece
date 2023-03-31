import 'package:flutter/material.dart';

class Connectionfailed extends StatelessWidget {
  const Connectionfailed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/net.jpg'),
          const Text('check your connection')
        ],
      ),
    );
  }
}
