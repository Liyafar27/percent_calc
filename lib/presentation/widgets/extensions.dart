String formatNumber(double value) {
  if (value == value.roundToDouble()) {
    return value.toStringAsFixed(0);
  } else if ((value * 10) == (value * 10).roundToDouble()) {
    return value.toStringAsFixed(1);
  } else {
    return value.toStringAsFixed(2);
  }
}
