import 'package:flutter/material.dart';

class Story {
  Story({
    Key? key,
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
  });

  final String storyTitle;
  final String choice1;
  final String choice2;
}
