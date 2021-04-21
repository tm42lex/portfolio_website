const double smartphoneUpperBound       = 600.0;
const double tabletUpperBound           = 1025.0;
const double tabletUpperBound_Small     = 800.0;

bool isSmartphoneWidth(double width) {
  return  (width < smartphoneUpperBound);
}

bool isTabletWidth (double width) {
  return  (width >= smartphoneUpperBound && width < tabletUpperBound);
}

bool isTabletWidth_Big(double width) {
  return  (width >= tabletUpperBound_Small&& width < tabletUpperBound);
}
bool isTabletWidth_Small (double width) {
  return  (width >= smartphoneUpperBound && width < tabletUpperBound_Small);
}

bool isComputerWidth (double width) {
  return  (width >= tabletUpperBound);
}
