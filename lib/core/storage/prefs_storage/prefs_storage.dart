import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_keys.dart';

class PrefsStorage {
  PrefsStorage._();

  static final PrefsStorage instance = PrefsStorage._();

  late final SharedPreferencesWithCache _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  Future<void> saveLargeString() async {
    const targetSizeInMB = 200;
    const charsCount = (targetSizeInMB * 1024 * 1024) ~/ 2;
    final bigString = 'A' * charsCount;

    await _prefs.setString(_PrefsKeys.largeString, bigString);
  }

  Set<String> getDisabledFeatures() {
    return _prefs.getStringList(_PrefsKeys.disabledFeatures)?.toSet() ?? {};
  }

  Future<void> setDisabledFeatures(Set<String> value) async {
    await _prefs.setStringList(_PrefsKeys.disabledFeatures, value.toList());
  }

  Future<void> setTopPageViewCounter(int value) async {
    await _prefs.setInt(_PrefsKeys.pageViewCounter, value);
  }

  int getTopPageViewCounter() {
    return _prefs.getInt(_PrefsKeys.pageViewCounter) ?? 0;
  }

  Future<void> setSelectedRegion(String region, int index) async {
    await _prefs.setString(_PrefsKeys.regionName, region);
    await _prefs.setInt(_PrefsKeys.regionIndex, index);
  }

  Future<String> getSelectedRegion() async {
    return _prefs.getString(_PrefsKeys.regionName) ?? '';
  }

  Future<int> getSelectedRegionIndex() async {
    return _prefs.getInt(_PrefsKeys.regionIndex) ?? -1;
  }
}
