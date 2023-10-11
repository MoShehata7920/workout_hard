import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_hard/provider/workout_provide.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/resources/strings_manager.dart';
import 'package:workout_hard/widgets/card_widget.dart';
import 'package:workout_hard/widgets/image_circle_avatar_widget.dart';
import 'package:workout_hard/widgets/search_text_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.whatUDoToday,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 15),
          const SearchTextFiled(),
          const SizedBox(height: 15),
          const Row(
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
          ),
          const SizedBox(height: 15),
          const Text(
            AppStrings.withoutPacks,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<WorkOutData>(
                context,
                listen: false,
              ).workOutList.length,
              itemBuilder: ((context, index) => CardWidget(
                    cardImage: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].imageUrl,
                    trainTime: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].time,
                    numOfExercises: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].exercises,
                    cost: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].cost,
                    isTopRated: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].isTopRated,
                    trainerName: Provider.of<WorkOutData>(
                      context,
                      listen: false,
                    ).workOutList[index].trainer,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
