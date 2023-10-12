import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_hard/provider/exercise_provider.dart';
import 'package:workout_hard/provider/workout_provide.dart';
import 'package:workout_hard/resources/assets_manager.dart';
import 'package:workout_hard/resources/routes_manager.dart';
import 'package:workout_hard/resources/strings_manager.dart';
import 'package:workout_hard/widgets/card_widget.dart';
import 'package:workout_hard/widgets/image_circle_avatar_widget.dart';
import 'package:workout_hard/widgets/scrollable_list_widget.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.withoutPacks,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => viewAllExercises(context),
                    );
                  },
                  child: const Text(
                    AppStrings.viewAllExercises,
                  ))
            ],
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

  Widget viewAllExercises(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        color: const Color(0xFF00001a),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              const Text(
                AppStrings.allExercises,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        Provider.of<ExerciseData>(context).exerciseList.length,
                    itemBuilder: (context, index) => ScrollableList(
                          itemAsset: ImageAssets.gym4,
                          itemText: Provider.of<ExerciseData>(
                            context,
                            listen: false,
                          ).exerciseList[index].legExtension,
                          tileFunction: () {
                            Navigator.of(context).pushNamed(
                              Routes.detailsScreenRoute,
                              arguments: Provider.of<ExerciseData>(context,
                                      listen: false)
                                  .exerciseList[index]
                                  .workOutId,
                            );
                          },
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
