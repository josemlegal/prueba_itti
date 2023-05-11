import 'package:flutter/material.dart';
import 'package:prueba_itti/domain/models/user_model.dart';

class UserDetailsView extends StatelessWidget {
  final statusColor = {
    'Active': Colors.green,
    'Inactive': Colors.grey,
    'Blocked': Colors.red,
  };
  static const name = 'user-details';

  final User user;
  UserDetailsView({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details: ${user.firstName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(user.avatar),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${user.firstName} ${user.lastName}',
                style: Theme.of(context).textTheme.displayLarge),
            Text(
              user.email,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '${user.status} user.',
              style: TextStyle(
                fontSize: 20,
                color: statusColor[user.status],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
