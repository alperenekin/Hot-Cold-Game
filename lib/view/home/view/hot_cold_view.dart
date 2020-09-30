import 'package:chance_button/core/button/standard_raised_button.dart';
import 'package:chance_button/core/extension/context_extension.dart';
import 'package:chance_button/view/home/model/result_enum.dart';
import 'package:chance_button/view/home/viewmodel/hot_cold_viewmodel.dart';
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
        centerTitle: true,
        title: Text(
          "Hot Or Cold",
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 2,
                child: hotOrColdColumn(),
              ),
              Flexible(
                flex: 1,
                child: randomShower(),
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
        cheatRaisedButton()
      ],
    );
  }

  Observer coldObserver() {
    return Observer(builder: (context) {
      return Container(
        width: 100,
        height: 100,
        child: Icon(Icons.ac_unit),
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
        child: Icon(Icons.done),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: model.resultEnum == ResultEnum.HIT
                ? Colors.green
                : Colors.grey),
      );
    });
  }
  Observer randomShower() {
    return Observer(builder: (context) {
      return Visibility(
          visible: model.isVisible, child: Text(model.randomNumber.toString()));
    });
  }

  StandardRaisedButton cheatRaisedButton() {
    return StandardRaisedButton(
        color: Colors.blue.shade200,
        onPressed: () {
          model.changeVisibility();
        },
        child: Observer(builder: (context) {
          return model.isVisible
              ? Text(
                  "Hide Answer",
                  textScaleFactor: context.fixScaleFactor,
                )
              : Text(
                  "Show Me Answer",
                  textScaleFactor: context.fixScaleFactor,
                );
        }));
  }

  Observer hotObserver() {
    return Observer(builder: (context) {
      return Container(
        width: 100,
        height: 100,
        child: Icon(Icons.wb_sunny),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                model.resultEnum == ResultEnum.HOT ? Colors.red : Colors.grey),
      );
    });
  }



  Container buildGuessContainer() {
    return Container(
      width: 200,
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: context.paddingLow, hintText: "Type your guess"),
        controller: model.myController,
      ),
    );
  }

  StandardRaisedButton makeGuessButton() {
    return StandardRaisedButton(
      color: Colors.blue.shade200,
      onPressed: () {
        model.isHotOrCold(int.parse(model.myController.text));
      },
      child: Text(
        "Send your guess",
        textScaleFactor: context.fixScaleFactor,
      ),
    );
  }
}
