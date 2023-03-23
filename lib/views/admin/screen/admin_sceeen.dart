import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/global_variables.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminProvider provider = Provider.of<AdminProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Admin',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: provider.pages[provider.currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currenIndex,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (value) {
          provider.updatePage(value);
        },
        items: const [
          // POSTS
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          // ANALYTICS
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics_outlined,
            ),
            label: '',
          ),
          // ORDERS
          BottomNavigationBarItem(
            icon: Icon(
              Icons.all_inbox_outlined,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
