import 'package:prueba_itti/core/theme/app.theme.dart';
import 'package:riverpod/riverpod.dart';

final colorListProvider = Provider((ref) => colorList);

final themeNotifierProvider = StateNotifierProvider<ThemeController, AppTheme>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<AppTheme> {
  ThemeController() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSelectedColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
