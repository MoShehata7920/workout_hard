import 'package:flutter/material.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/resources/strings_manager.dart';
import 'package:workout_hard/widgets/image_circle_avatar_widget.dart';
import 'package:workout_hard/widgets/search_text_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.whatUDoToday,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 15),
          SearchTextFiled(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageCircleAvatar(
                colored: Colors.purple,
                assetName: ImageAssets.gym1,
                title: AppStrings.crossFit,
              ),
              ImageCircleAvatar(
                colored: Colors.deepOrange,
                assetName: ImageAssets.gym3,
                title: AppStrings.gymnastics,
              ),
              ImageCircleAvatar(
                colored: Colors.blue,
                assetName: ImageAssets.gym2,
                title: AppStrings.fitness,
              ),
              ImageCircleAvatar(
                colored: Colors.brown,
                assetName: ImageAssets.gym4,
                title: AppStrings.aerobics,
              ),
            ],
          )
        ],
      ),
    );
  }
}
