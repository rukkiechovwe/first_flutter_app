import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/toolbar.dart';
import 'package:flutter_application_1/components/user_avatar.dart';
import 'package:flutter_application_1/config/app_routes.dart';
import 'package:flutter_application_1/config/app_strings.dart';
import 'package:flutter_application_1/styles/app_text.dart';
import 'package:flutter_application_1/utils/auth.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  final AuthGuard authGuard = AuthGuard();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Toolbar(
          title: AppStrings.profile,
          actions: [
            PopupMenuButton<ProfileMenu>(
                onSelected: (value) {
                  switch (value) {
                    case ProfileMenu.edit:
                      Navigator.of(context).pushNamed(AppRoutes.editProfile);
                      break;

                    case ProfileMenu.logout:
                      print(AppStrings.logout);
                      break;
                    default:
                  }
                },
                icon: const Icon(Icons.more_vert_rounded),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: ProfileMenu.edit,
                      child: Text(AppStrings.edit),
                    ),
                    const PopupMenuItem(
                      value: ProfileMenu.logout,
                      child: Text(AppStrings.logout),
                    ),
                  ];
                }),
          ],
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const UserAvatar(size: 120),
            const SizedBox(
              height: 24,
            ),
            const Center(
              child: Text('Ufuoma Oghenechovwe', style: AppText.header3),
            ),
            const SizedBox(
              height: 12,
            ),
            const Center(
              child: Text('Nigeria', style: AppText.subTitle4),
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('417', style: AppText.header3),
                    Text(AppStrings.followers, style: AppText.body2),
                  ],
                ),
                Column(
                  children: [
                    Text('119', style: AppText.header3),
                    Text(AppStrings.posts, style: AppText.body2),
                  ],
                ),
                Column(
                  children: [
                    Text('840', style: AppText.header3),
                    Text(AppStrings.following, style: AppText.body2),
                  ],
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),
            AppButton(
                text: 'logout',
                onPressed: () async => await authGuard.logout()),
          ],
        ),
      ),
    );
  }
}
