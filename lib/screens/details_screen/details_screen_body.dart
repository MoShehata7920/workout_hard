import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_hard/models/exercise_model.dart';
import 'package:workout_hard/resources/strings_manager.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody(
      {super.key,
      required this.workoutImage,
      required this.trainerName,
      required this.workoutTitle,
      required this.workoutDescription,
      required this.controller,
      required this.exercise});
  final String workoutImage, trainerName, workoutTitle, workoutDescription;
  final VideoPlayerController controller;
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                workoutImage,
              ),
            ),
          ),
        ),
        SlidingUpPanel(
          backdropColor: const Color(0xFF00001a),
          backdropEnabled: true,
          minHeight: 80,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          panelBuilder: (ScrollController sc) => Container(
            color: const Color(0xFF00001a),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          workoutImage,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workoutTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(AppStrings.coach)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    AppStrings.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    workoutDescription,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          // VIDEO
                          Center(
                            child: controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
                                  )
                                : Container(),
                          ),

                          const Divider(
                            color: Colors.white,
                          ),
                          customListTile(AppStrings.squat, exercise.squat),
                          const Divider(),
                          customListTile(
                              AppStrings.legPress, exercise.legPress),
                          const Divider(),
                          customListTile(AppStrings.lunge, exercise.lunge),
                          const Divider(),
                          customListTile(
                              AppStrings.legExtension, exercise.legExtension),

                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF00453D),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                AppStrings.getStarted,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customListTile(String title, String duration) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        duration,
      ),
    );
  }
}
