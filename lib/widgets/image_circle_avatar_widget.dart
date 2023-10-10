import 'package:flutter/material.dart';

class ImageCircleAvatar extends StatelessWidget {
  const ImageCircleAvatar(
      {super.key,
      required this.colored,
      required this.assetName,
      required this.title});
  final Color colored;
  final String assetName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colored,
                blurRadius: 6,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: colored,
            radius: 23,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(assetName),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
