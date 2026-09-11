import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../data/repositories/settings_repository_impl.dart';

final settingsControllerProvider = StateNotifierProvider<SettingsController, bool>((ref) {
  final repo = ref.watch(settingsRepositoryProvider);
  return SettingsController(repo);
});

class SettingsController extends StateNotifier<bool> {
  final SettingsRepository repository;

  SettingsController(this.repository) : super(true) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    state = await repository.getIsCelsius();
  }

  Future<void> toggleUnit() async {
    final newValue = !state;
    await repository.setCelsius(newValue);
    state = newValue;
  }
}
