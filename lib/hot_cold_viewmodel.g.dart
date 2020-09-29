// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_cold_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HotColdViewModelStore on HotColdViewModel, Store {
  final _$randomNumberAtom = Atom(name: 'HotColdViewModel.randomNumber');

  @override
  int get randomNumber {
    _$randomNumberAtom.reportRead();
    return super.randomNumber;
  }

  @override
  set randomNumber(int value) {
    _$randomNumberAtom.reportWrite(value, super.randomNumber, () {
      super.randomNumber = value;
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
  String toString() {
    return '''
randomNumber: ${randomNumber},
resultEnum: ${resultEnum}
    ''';
  }
}
