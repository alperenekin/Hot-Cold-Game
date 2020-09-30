// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_cold_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HotColdViewModelStore on HotColdViewModel, Store {
  final _$isVisibleAtom = Atom(name: 'HotColdViewModel.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  final _$resultEnumAtom = Atom(name: 'HotColdViewModel.resultEnum');

  @override
  ResultEnum get resultEnum {
    _$resultEnumAtom.reportRead();
    return super.resultEnum;
  }

  @override
  set resultEnum(ResultEnum value) {
    _$resultEnumAtom.reportWrite(value, super.resultEnum, () {
      super.resultEnum = value;
    });
  }

  final _$HotColdViewModelActionController =
      ActionController(name: 'HotColdViewModel');

  @override
  void initRandom() {
    final _$actionInfo = _$HotColdViewModelActionController.startAction(
        name: 'HotColdViewModel.initRandom');
    try {
      return super.initRandom();
    } finally {
      _$HotColdViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisibility() {
    final _$actionInfo = _$HotColdViewModelActionController.startAction(
        name: 'HotColdViewModel.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$HotColdViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isHotOrCold(int guess) {
    final _$actionInfo = _$HotColdViewModelActionController.startAction(
        name: 'HotColdViewModel.isHotOrCold');
    try {
      return super.isHotOrCold(guess);
    } finally {
      _$HotColdViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
resultEnum: ${resultEnum}
    ''';
  }
}
