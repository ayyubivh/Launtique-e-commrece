import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Shopping information',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                  kHeight5,
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery to ${user.name} ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato',
                              letterSpacing: 0.5),
                          // overflow: TextOverflow.clip,
                        ),
                        kHeight5,
                        Text(
                          user.address,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lato',
                          ),
                          // overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
