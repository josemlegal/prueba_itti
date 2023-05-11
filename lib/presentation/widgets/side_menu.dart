import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_itti/core/side_menu/side_menu_list.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;
    final colors = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25, hasNotch ? 10 : 20, 16, 10),
          child: const Text('ITTI APP'),
        ),
        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),
        const Divider(),
        const _LicensesButton(),
        _LogoutButton(colors: colors),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text('Logout'),
      icon: Icon(Icons.logout_outlined, color: colors.primary),
      onPressed: () {
        context.push(
          '/login-view',
        );
      },
    );
  }
}

class _LicensesButton extends StatelessWidget {
  const _LicensesButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showAboutDialog(
          context: context,
          children: [const Text('Deseas ver las licencias de la apliacion?')],
        );
      },
      child: const Text('Licencias'),
    );
  }
}
