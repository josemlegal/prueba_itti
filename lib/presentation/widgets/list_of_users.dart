import 'package:flutter/material.dart';
import 'package:prueba_itti/domain/models/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListOfUsers extends StatelessWidget {
  final Function(User) onTap;
  final List<User> users;

  const ListOfUsers({super.key, required this.users, required this.onTap});

  _launchURL() async {
    Uri url = Uri.parse('https://www.google.com');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                subtitle: InkWell(
                    onTap: _launchURL,
                    child: Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    )),
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
