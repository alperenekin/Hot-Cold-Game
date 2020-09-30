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
  bool isVisible = false;

  @observable
  ResultEnum resultEnum;

  int _difference;
  int _difference2 = 0;

  @action
  void initRandom(){
    Random random = new Random();
    int number = random.nextInt(100);
    randomNumber = number;
  }

  @action
  void changeVisibility(){
    isVisible = !isVisible;
  }

  @action
  void isHotOrCold(int guess){
    _difference = guess - randomNumber;
    if( _difference != 0){
        if(_difference.abs() > _difference2.abs()){
          resultEnum = ResultEnum.COLD;
        }else{
          resultEnum = ResultEnum.HOT;
        }
    }else{
      resultEnum = ResultEnum.HIT;
    }
    _difference2 = _difference;
    myController.text = "";
  }
}