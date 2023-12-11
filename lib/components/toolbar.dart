import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const Toolbar({super.key,required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: actions,
    );
  }
}
