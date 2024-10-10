import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/theme_provider.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(navigatorKey.currentContext!);
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'logout') {
          Provider.of<AuthProvider>(navigatorKey.currentContext!, listen: false).signOut();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'logout',
            child: Text('Logout'),
          ),
        ];
      },
      icon: Icon(Icons.person,color: theme.getLightColor),
    );
  }
}