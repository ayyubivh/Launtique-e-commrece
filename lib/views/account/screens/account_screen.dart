import 'package:flutter/material.dart';
import '../../../core/global_variables.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.blueGrey),
          backgroundColor: GlobalVariables.appBarColor,
          elevation: 0,
          title: const Text(
            'LAUNTIQUE',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          Orders(),
        ],
      ),
    );
  }
}
