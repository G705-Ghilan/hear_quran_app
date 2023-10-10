 double lerpInt(
    double from,
    double to,
    double percent, [
    double? max,
    double? min,
  ]) {
    double result = from + (to - from) * percent;
    if (max != null && min != null) {
      result = result > max ? max : (result < min ? min : result);
    }
    return result;
  }