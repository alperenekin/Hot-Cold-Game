

import 'dart:math';

import 'package:mobx/mobx.dart';

abstract class DecideButtonViewModel with Store{
  @observable
  int randomNumber;

  int difference;
  int difference2;

  @action
  void initRandom(){
    Random random = new Random();
    int number = random.nextInt(100);
    randomNumber = number;
  }

  bool isHotOrCold(int guess){
    //fil this method
  }
}