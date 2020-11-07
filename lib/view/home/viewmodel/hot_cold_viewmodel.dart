import 'dart:math';
import 'package:chance_button/core/service/push_notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:chance_button/core/base/model/base_view_model.dart';
import 'package:chance_button/core/constant/app_constants.dart';
import 'package:chance_button/view/home/model/result_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'hot_cold_viewmodel.g.dart';

class HotColdViewModelStore = HotColdViewModel with _$HotColdViewModelStore;
abstract class HotColdViewModel with Store,BaseViewModel{
  final Map<String,String> languages = {
    'English': 'assets/uk.png',
    'Turkish': 'assets/tr.png'
  };
  String selectedLanguage;
  int randomNumber;
  int _difference;
  int _differenceAfter = 0;
  final myController = TextEditingController();
  final PushNotificationService pushNotificationService = PushNotificationService();
  @observable
  bool isVisible = false;

  @observable
  ResultEnum resultEnum;

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {
    selectedLanguage = languages.keys.toList()[0];
    initRandom();
    pushNotificationInit();
  }

  Future<void> pushNotificationInit() async {
    final value = await pushNotificationService.getToken();
    print(value);
    pushNotificationService.getPermission();
    await pushNotificationService.initialise();
  }

  void initRandom(){
    Random random = new Random();
    randomNumber = random.nextInt(100);
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

  void setLanguage(String language){
    switch(language){
      case "English":
         context.locale = AppConstants.EN_LOCALE;
        break;
      case "Turkish":
        context.locale = AppConstants.TR_LOCALE;
        break;
    }
  }
}