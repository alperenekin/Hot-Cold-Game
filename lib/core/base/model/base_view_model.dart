import 'package:flutter/cupertino.dart';

abstract class BaseViewModel{
  BuildContext context;

  void setContext(BuildContext context);
  void init();
}