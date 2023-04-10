import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier{
  int tabIndex = 0;

  setIndex(int index){
    print("2. provider - set index : $index");
    tabIndex = index;
    notifyListeners();
  }
}