int gridCardsCount(double width, [bool isWide = false]) {
  if (!isWide) return 3;
  return (width / 250).ceil();
}
