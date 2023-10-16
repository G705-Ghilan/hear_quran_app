class Images {
  static const String _base = "assets/images";
  static const String _animateBase = "assets/animate";

  static String reciterImg(String img) {
    return "$_base/reciters/$img";
  }
  static String lottie(String img) {
    return "$_animateBase/$img";
  }
}
