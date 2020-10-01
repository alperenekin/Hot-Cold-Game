import 'dart:math';
import 'package:chance_button/core/base/model/base_view_model.dart';
import 'package:chance_button/view/home/model/result_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'hot_cold_viewmodel.g.dart';

class HotColdViewModelStore = HotColdViewModel with _$HotColdViewModelStore;
abstract class HotColdViewModel with Store,BaseViewModel{

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {}

  int randomNumber;
  final myController = TextEditingController();

  @observable
  bool isVisible = false;

  @observable
  ResultEnum resultEnum;

  int _difference;
  int _differenceAfter = 0;

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
        if(_difference.abs() > _differenceAfter.abs()){
          resultEnum = ResultEnum.COLD;
        }else{
          resultEnum = ResultEnum.HOT;
        }
    }else{
      resultEnum = ResultEnum.HIT;
    }
    _differenceAfter = _difference;
    myController.text = "";
  }
}