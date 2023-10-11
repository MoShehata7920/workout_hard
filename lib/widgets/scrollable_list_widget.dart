import 'package:flutter/material.dart';

class ScrollableList extends StatelessWidget {
  const ScrollableList(
      {super.key, required this.itemAsset, required this.itemText});
  final String itemAsset, itemText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: const Color(0xFF00453D),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(itemAsset),
          )),
      title: RichText(
        text: TextSpan(
            text: 'SQUAT ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: itemText,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                ),
              )
            ]),
      ),
    );
  }
}
