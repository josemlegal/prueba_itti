import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_itti/presentation/controllers/settings_view_controller.dart';

class SettingsView extends ConsumerWidget {
  static const name = 'settings-view';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref
              //     .read(isDarkModeProvider.notifier)
              //     .update((isDarkMode) => !isDarkMode);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: isDarkMode
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: const _ThemeChanger(),
    );
  }
}

class _ThemeChanger extends ConsumerWidget {
  const _ThemeChanger();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            'Color',
            style: TextStyle(color: color),
          ),
          value: index,
          activeColor: color,
          groupValue: selectedColor,
          onChanged: ((value) {
            ref.read(themeNotifierProvider.notifier).changeSelectedColor(index);
          }),
        );
      },
    );
  }
}
