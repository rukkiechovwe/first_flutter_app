import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_text.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/avatar-3.jpg',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Text('Sarah Fernadez')
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset('assets/images/bedframe.png',),
          const SizedBox(
            height: 10,
          ),
          Text(
            "I love this bedframe so much. I'm thinking of getting it",
            style: AppText.subTitle4,
          )
        ],
      ),
    );
  }
}
