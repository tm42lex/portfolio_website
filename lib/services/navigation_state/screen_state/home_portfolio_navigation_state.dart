import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums.dart';

class ScreenStateTypeModel{
  final ScreenStateType type;
  const ScreenStateTypeModel(this.type);
}

class ScreenStateTypeNotifier extends StateNotifier<ScreenStateTypeModel> {
  ScreenStateTypeNotifier() : super(_initialState);

  static final _initialState = ScreenStateTypeModel(
    ScreenStateType.home,
  );

  void jumpToType(ScreenStateType type) {
    state = ScreenStateTypeModel(type);
  }

  void incrementPage() {
    final int   pageMax = ScreenStateType.values.length - 1;
    int   index   = pageMax;

    if (state.type.index != pageMax)
      index = state.type.index + 1;
    state = ScreenStateTypeModel(ScreenStateType.values[index]);
  }

  void decrementPage() {
    final int   pageMin = 0;
    int   index   = pageMin;
    if (state.type.index != pageMin)
      index = state.type.index - 1;
    state = ScreenStateTypeModel(ScreenStateType.values[index]);
  }
}
