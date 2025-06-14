double calculatePercent(double value, double percent) {
  if (value <= 0 || percent <= 0) throw ArgumentError("Inputs must be positive");
  return value / percent * 100;
}