import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/views/account/services/account_service.dart';
import 'package:flutter/material.dart';

import 'account_button.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        kHeight15,
        Row(
          children: [
            AccountButton(
                text: 'Log Out',
                onTap: () {
                  popUpDialog(context);
                }),
            AccountButton(
              text: 'Your Wish List',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you to logout?'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                AccountServices().logOut(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.green,
              ),
            )
          ],
        );
      },
    );
  }
}
