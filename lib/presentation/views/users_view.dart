import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prueba_itti/presentation/controllers/users_view_controller.dart';
import 'package:prueba_itti/presentation/widgets/list_of_users.dart';
import 'package:prueba_itti/presentation/widgets/side_menu.dart';

class UsersView extends StatefulHookConsumerWidget {
  static const String name = '/';
  const UsersView({Key? key}) : super(key: key);

  @override
  ConsumerState<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  void initState() {
    ref.read(usersProvider).getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final listOfUsers =
        ref.watch(usersProvider.select((value) => value.usersList));
    final isLoading =
        ref.watch(usersProvider.select((value) => value.isLoading));
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('ITTI Users'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListOfUsers(
                users: listOfUsers,
                onTap: (user) {
                  final status = ref.read(usersProvider).setUserState();
                  final userWithStatus = user.copyWith(status: status);
                  context.push(
                    '/user-details',
                    extra: userWithStatus,
                  );
                },
              ),
            ),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
