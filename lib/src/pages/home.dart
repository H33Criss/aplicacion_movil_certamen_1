import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/menu/menu_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('The High Table'),
        leading: Center(
          child: Image.asset(
            'assets/imgs/logo.png',
            width: 45.0,
            height: 45.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            splashColor: colors.primary.withOpacity(0.35),
            title: Text(
              item.title,
              style: textStyles.bodyLarge,
            ),
            subtitle: Text(item.subTitle),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: colors.primary,
            ),
            leading: Icon(
              item.icon,
              color: colors.primary,
            ),
            // ignore: avoid_print
            onTap: () => context.push(item.link),
          );
        },
      ),
    );
  }
}
