enum BoxKeys {
  themeMode(1),
  language(null),
  favorites([]),
  reciter(0),
  lastSurah(0),
  lastTime("00:00:00.00"),
  showMiniPlayer(false),
  loopMode(1),
  shufle(false),
  offlineMode(false);

  final dynamic defaultValue;
  const BoxKeys(this.defaultValue);
}
