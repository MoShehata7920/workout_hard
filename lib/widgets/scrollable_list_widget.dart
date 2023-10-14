import 'package:flutter/material.dart';
import 'package:workout_hard/resources/assets_manager.dart';

class ScrollableList extends StatelessWidget {
  const ScrollableList(
      {super.key,
      required this.itemAsset,
      required this.itemText,
      required this.tileFunction});
  final String itemAsset, itemText;
  final Function tileFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tileFunction();
      },
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: const Color(0xFF00453D),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(itemAsset),
            )),
        trailing: Image.asset(
          ImageAssets.medal,
          width: 15,
        ),
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
      ),
    );
  }
}
