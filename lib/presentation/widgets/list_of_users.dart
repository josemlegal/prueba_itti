import 'package:flutter/material.dart';
import 'package:prueba_itti/domain/models/user_model.dart';

class ListOfUsers extends StatelessWidget {
  final Function(User) onTap;
  final List<User> users;

  const ListOfUsers({super.key, required this.users, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          for (User user in users)
            Card(
              color: colors.brightness == Brightness.dark
                  ? colors.surfaceVariant
                  : colors.surface,
              child: ListTile(
                onTap: () {
                  onTap(user);
                },
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: RichText(
                  text: TextSpan(
                    text: user.email,
                    style: TextStyle(
                      color: colors.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     launch(user.email);
                    //   },
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
        ],
      ),
    );
  }
}
