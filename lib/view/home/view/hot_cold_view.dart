import 'package:chance_button/core/base/state/base_state.dart';
import 'package:chance_button/core/base/widget/base_widget.dart';
import 'package:chance_button/core/component/button/standard_raised_button.dart';
import 'package:chance_button/core/component/lottie/lottie_widget.dart';
import 'package:chance_button/core/extension/context_extension.dart';
import 'package:chance_button/core/generated/locale_keys.g.dart';
import 'package:chance_button/view/home/model/result_enum.dart';
import 'package:chance_button/view/home/viewmodel/hot_cold_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HotColdView extends StatefulWidget {
  @override
  _HotColdViewState createState() => _HotColdViewState();
}

class _HotColdViewState extends BaseState<HotColdView> {
  HotColdViewModelStore viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HotColdViewModelStore>(
      viewModel: HotColdViewModelStore(),
      onModelReady: (model) {
        // model type is HotColdViewModelStore
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, HotColdViewModelStore value) =>
          Scaffold(
        appBar: AppBar(
          title: Text("Hot Or Cold"),
          actions: [languageButton()],
        ),
        body: buildView(),
      ),
    );
  }

  FlatButton languageButton() {
    return FlatButton(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: viewModel.selectedLanguage,
            items: viewModel.languages
                .map((language, flag) {
                  return MapEntry(
                      language,
                      DropdownMenuItem(
                        value: language,
                        child: Row(
                          children: [
                            Text(
                              language,
                              style: TextStyle(color: Colors.black),
                              textScaleFactor: context.fixScaleFactor,
                            ),
                            SizedBox(
                              width: context.lowValue,
                            ),
                            Container(
                                width: dynamicWidth(0.07),
                                height: dynamicHeight(0.07),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(flag))))
                          ],
                        ),
                      ));
                })
                .values
                .toList(),
            onChanged: (value) {
              viewModel.selectedLanguage = value;
              viewModel.setLanguage(viewModel.selectedLanguage);
            }),
      ),
    );
  }

  SingleChildScrollView buildView() {
    return SingleChildScrollView(
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

  Observer greenObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        child: viewModel.resultEnum == ResultEnum.HIT
            ? LottieWidget(path: "congrats")
            : Icon(Icons.done),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.HIT
                ? Colors.green
                : Colors.grey),
      );
    });
  }

  Observer coldObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        child: Icon(Icons.ac_unit),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.COLD
                ? Colors.blue
                : Colors.grey),
      );
    });
  }

  Observer hotObserver() {
    return Observer(builder: (context) {
      return Container(
        width: dynamicWidth(0.2),
        height: dynamicHeight(0.15),
        child: Icon(Icons.wb_sunny),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadius),
            color: viewModel.resultEnum == ResultEnum.HOT
                ? Colors.red
                : Colors.grey),
      );
    });
  }

  Container buildGuessContainer() {
    return Container(
      width: dynamicWidth(0.45),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: context.paddingLow,
            hintText: LocaleKeys.view_hint.tr()),
        controller: viewModel.myController,
      ),
    );
  }

  StandardRaisedButton makeGuessButton() {
    return StandardRaisedButton(
      color: Colors.blue.shade200,
      onPressed: () {
        viewModel.isHotOrCold(int.parse(viewModel.myController.text));
      },
      child: Text(
        LocaleKeys.view_send.tr(),
        textScaleFactor: context.fixScaleFactor,
      ),
    );
  }

  StandardRaisedButton cheatRaisedButton() {
    return StandardRaisedButton(
        color: Colors.blue.shade200,
        onPressed: () {
          viewModel.changeVisibility();
        },
        child: Observer(builder: (context) {
          return viewModel.isVisible
              ? Text(
                  LocaleKeys.view_hide.tr(),
                  textScaleFactor: context.fixScaleFactor,
                )
              : Text(
                  LocaleKeys.view_show.tr(),
                  textScaleFactor: context.fixScaleFactor,
                );
        }));
  }

  Observer randomShower() {
    return Observer(builder: (context) {
      return Visibility(
          visible: viewModel.isVisible,
          child: Text(
            viewModel.randomNumber.toString(),
            textScaleFactor: context.fixScaleFactor,
          ));
    });
  }
}
