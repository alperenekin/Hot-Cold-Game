import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  final String path;

  const LottieWidget({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset("assets/lottie/$path.json");
  }
}
