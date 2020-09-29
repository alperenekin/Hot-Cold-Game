import 'package:chance_button/hot_cold_viewmodel.dart';
import 'package:chance_button/result_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HotColdView extends StatefulWidget {
  @override
  _HotColdViewState createState() => _HotColdViewState();
}

class _HotColdViewState extends State<HotColdView> {
  HotColdViewModel model;

  @override
  void initState() {
    model = HotColdViewModelStore();
    model.initRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hot Or Cold"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 2,
                child: hotOrColdColumn(),
              ),
              Flexible(
                flex: 1,
                child: Text(model.randomNumber.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column hotOrColdColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            hotObserver(),
            greenObserver(),
            coldObserver(),
          ],
        ),
        buildGuessContainer(),
        makeGuessButton(),
      ],
    );
  }

  Observer hotObserver() {
    return Observer(builder: (context) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                model.resultEnum == ResultEnum.HOT ? Colors.red : Colors.grey),
      );
    });
  }

  Observer coldObserver() {
    return Observer(builder: (context) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: model.resultEnum == ResultEnum.COLD
                ? Colors.blue
                : Colors.grey),
      );
    });
  }

  Observer greenObserver() {
    return Observer(builder: (context) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: model.resultEnum == ResultEnum.HIT
                ? Colors.green
                : Colors.grey),
      );
    });
  }

  Container buildGuessContainer() {
    return Container(
      width: 200,
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8), hintText: "Type your guess"),
        controller: model.myController,
      ),
    );
  }

  RaisedButton makeGuessButton() {
    return RaisedButton(
      onPressed: () {
        print(model.randomNumber);
        model.isHotOrCold(int.parse(model.myController.text));
      },
      child: Text("Send your guess"),
    );
  }
}
