import 'dart:math';
import 'package:flutter/material.dart';

class AppConstant {
  static final List<Map<String, dynamic>> defaultQues = [
    {
      "title": "Most Popular",
      "ques": [
        {
          "icon": Icons.ac_unit,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "What is AI?"
        },
        {
          "icon": Icons.face,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "Tell me a joke"
        },
        {
          "icon": Icons.account_tree_sharp,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "Explain the Concept of Machine Learning?"
        },
        {
          "icon": Icons.cloudy_snowing,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "How does Climate change work?"
        }
      ]
    },
    {
      "title": "Trending",
      "ques": [
        {
          "icon": Icons.heart_broken_sharp,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "What is meaning of life?"
        },
        {
          "icon": Icons.face,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "Tell me a joke"
        },
      ]
    },
    {
      "title": "Instagram",
      "ques": [
        {
          "icon": Icons.social_distance,
          "color": Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          "Ques": "What is most followed person on Insta?"
        },
      ]
    }
  ];
}
