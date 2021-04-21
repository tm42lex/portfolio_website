import 'package:portfolio_website/services/navigation_state/enums.dart';
import 'package:portfolio_website/services/navigation_state/screen_state/home_portfolio_navigation_state.dart';

String screenStateTypeToString(ScreenStateType type) {
  if (type == ScreenStateType.portfolio) {
    return ('Portfolio');
  }
  else {
    return ('Home');
  }
}

String homeWindowStateTypeToString(HomeWindowStateType type) {
  if (type == HomeWindowStateType.profile) {
    return ('Profile');
  }
  else {
    return ('Home');
  }
}

String portfolioWindowStateTypeToString(PortfolioWindowStateType type) {
 return ('Portfolio');
}

String subWindowStateTypeToString(dynamic type, SubWindowType subWindowType) {
  if (subWindowType == SubWindowType.HomeWindowStateType) {
    return homeWindowStateTypeToString(type);
  }
  if (subWindowType == SubWindowType.PortfolioStateType) {
    return portfolioWindowStateTypeToString(type);
  }
  return ("");
}
