import 'package:flutter/material.dart';
class CardItemModel{
  String cardTitle;
  IconData icon;
  int taskRemaining;
  double taskCompletion;

  CardItemModel(this.cardTitle, this.icon, this.taskRemaining,
      this.taskCompletion);

}