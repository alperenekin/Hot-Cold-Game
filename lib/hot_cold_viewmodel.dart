import 'dart:math';
import 'package:chance_button/result_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'hot_cold_viewmodel.g.dart';

class HotColdViewModelStore = HotColdViewModel with _$HotColdViewModelStore;
abstract class HotColdViewModel with Store{
  int randomNumber;
  final myController = TextEditingController();

  @observable
  ResultEnum resultEnum;

  int difference;
  int difference2 = 0;

  @action
  void initRandom(){
    Random random = new Random();
    int number = random.nextInt(100);
    randomNumber = number;
  }

  @action
  void isHotOrCold(int guess){
    difference = guess - randomNumber;
    if( difference != 0){
        if(difference.abs() > difference2.abs()){
          resultEnum = ResultEnum.COLD;
        }else{
          resultEnum = ResultEnum.HOT;
        }
    }else{
      resultEnum = ResultEnum.HIT;
    }
    difference2 = difference;
    myController.text = "";
  }
}