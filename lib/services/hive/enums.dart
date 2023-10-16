enum BoxKeys {
  themeMode(1),
  language(null),
  favorites([]),
  reciter(0),
  lastSurah(0),
  lastTime("00:00:00.00"),
  showMiniPlayer(false),
  loopMode(0),
  shufle(false),
  offlineMode(false),
  opensCount(0);

  final dynamic defaultValue;
  const BoxKeys(this.defaultValue);
}
