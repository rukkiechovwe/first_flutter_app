import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/components/toolbar.dart';
import 'package:flutter_application_1/components/user_avatar.dart';
import 'package:flutter_application_1/config/app_strings.dart';
import 'package:flutter_application_1/styles/app_color.dart';
import 'package:flutter_application_1/styles/app_text.dart';

enum Gender { none, male, female, other }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;
  var username = '';

  final TextEditingController _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: Toolbar(title: AppStrings.editProfile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const UserAvatar(size: 140),
              const SizedBox(
                height: 50,
              ),
              AppTextField(
                hint: AppStrings.firstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '${AppStrings.firstName} is required';
                  }

                  return null;
                },
                // onChanged: (value) {
                //   username = value;
                // },
                controller: _firstNameController,
              ),
              const SizedBox(
                height: 18,
              ),
              AppTextField(
                hint: AppStrings.lastName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '${AppStrings.lastName} is required';
                  }

                  return null;
                },
                // onChanged: (value) {
                //   username = value;
                // },
                controller: _firstNameController,
              ),
              const SizedBox(
                height: 18,
              ),
              AppTextField(
                hint: AppStrings.phoneNumber,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '${AppStrings.phoneNumber} is required';
                  }

                  return null;
                },
                // onChanged: (value) {
                //   username = value;
                // },
                controller: _firstNameController,
              ),
              const SizedBox(
                height: 18,
              ),
              AppTextField(
                hint: AppStrings.location,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '${AppStrings.location} is required';
                  }

                  return null;
                },
                // onChanged: (value) {
                //   username = value;
                // },
                controller: _firstNameController,
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: 6),
                decoration: BoxDecoration(
                  color: AppColor.fill,
                  border: Border.all(color: AppColor.border, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: AppText.body1
                            .copyWith(fontSize: 15, color: AppColor.font2),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                title: const Text('Male'),
                                value: Gender.male,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = Gender.male;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('Female'),
                                value: Gender.female,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = Gender.female;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('Other'),
                                value: Gender.other,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = Gender.other;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 24,
              ),
              AppButton(
                text: 'Save',
                onPressed: () {
                  print(username);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
