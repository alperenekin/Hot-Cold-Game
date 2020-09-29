

import 'dart:math';

import 'package:chance_button/result_enum.dart';
import 'package:mobx/mobx.dart';

abstract class DecideButtonViewModel with Store{
  @observable
  int randomNumber;
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
  }
}