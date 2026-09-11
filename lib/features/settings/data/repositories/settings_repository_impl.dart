import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../../../core/database/local_db.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl();
});

class SettingsRepositoryImpl implements SettingsRepository {
  static const _isCelsiusKey = 'is_celsius';

  @override
  Future<bool> getIsCelsius() async {
    return LocalDb.prefs.getBool(_isCelsiusKey) ?? true;
  }

  @override
  Future<void> setCelsius(bool isCelsius) async {
    await LocalDb.prefs.setBool(_isCelsiusKey, isCelsius);
  }
}
