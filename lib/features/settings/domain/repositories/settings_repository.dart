abstract class SettingsRepository {
  Future<bool> getIsCelsius();
  Future<void> setCelsius(bool isCelsius);
}
