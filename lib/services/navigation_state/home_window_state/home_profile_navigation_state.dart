import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums.dart';

class HomeWindowStateTypeModel{
  final HomeWindowStateType type;
  const HomeWindowStateTypeModel(this.type);
}

class HomeWindowStateTypeNotifier extends StateNotifier<HomeWindowStateTypeModel> {
  HomeWindowStateTypeNotifier() : super(_initialState);

  static final _initialState = HomeWindowStateTypeModel(
    HomeWindowStateType.home,
  );

  void jumpToType(HomeWindowStateType type) {
    state = HomeWindowStateTypeModel(type);
  }

  void resetToInitPage() {
    state = HomeWindowStateTypeModel(HomeWindowStateType.home);
  }

  void incrementPage() {
    final int   pageMax = HomeWindowStateType.values.length - 1;
          int   index   = pageMax;
    
    if (state.type.index != pageMax)
      index = state.type.index + 1;
    state = HomeWindowStateTypeModel(HomeWindowStateType.values[index]);
  }

  void decrementPage() {
    final int   pageMin = 0;
          int   index   = pageMin;
    if (state.type.index != pageMin)
      index = state.type.index - 1;
    state = HomeWindowStateTypeModel(HomeWindowStateType.values[index]);
  }
}