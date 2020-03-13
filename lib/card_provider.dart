import 'package:flutter/material.dart';
import 'CardItemModel.dart';

class CardList with ChangeNotifier{
  List<CardItemModel> _cardList =[
    CardItemModel("Personal", Icons.account_circle, 9, 0.83),
    CardItemModel("Work", Icons.work, 12, 0.24),
  ];
  List<CardItemModel> get cards{
    return [..._cardList];
  }
}