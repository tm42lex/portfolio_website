import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums.dart';

class PortfolioWindowStateTypeModel{
  final PortfolioWindowStateType type;
  const PortfolioWindowStateTypeModel(this.type);
}

class PortfolioWindowStateTypeNotifier extends StateNotifier<PortfolioWindowStateTypeModel> {
  PortfolioWindowStateTypeNotifier() : super(_initialState);

  static final _initialState = PortfolioWindowStateTypeModel(
    PortfolioWindowStateType.portfolio,
  );

  void jumpToType(PortfolioWindowStateType type) {
    state = PortfolioWindowStateTypeModel(type);
  }

  void resetToInitPage() {
    state = PortfolioWindowStateTypeModel(PortfolioWindowStateType.portfolio);
  }

  void incrementPage() {
    final int   pageMax = PortfolioWindowStateType.values.length - 1;
    int   index   = pageMax;

    if (state.type.index != pageMax)
      index = state.type.index + 1;
    state = PortfolioWindowStateTypeModel(PortfolioWindowStateType.values[index]);
  }

  void decrementPage() {
    final int   pageMin = 0;
    int   index   = pageMin;
    if (state.type.index != pageMin)
      index = state.type.index - 1;
    state = PortfolioWindowStateTypeModel(PortfolioWindowStateType.values[index]);
  }
}