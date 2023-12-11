import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/post_item.dart';
import 'package:flutter_application_1/components/toolbar.dart';
import 'package:flutter_application_1/config/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: Toolbar(
          title: AppRoutes.home,
          actions: [Icon(Icons.person_rounded)],
        ),
      ),
      body: ListView(
        children: mockUsersFromServer(),
      ),
    );
  }

  List<Widget> mockUsersFromServer() {
    List<Widget> users = [];
    for (var i = 0; i < 100; i++) {
      users.add(const PostItem());
    }
    return users;
  }
}
