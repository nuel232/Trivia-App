import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text('Tech Trivia'),
        centerTitle: true,

        actions: [
          Row(
            children: [
              Icon(
                themeProvider.isLightMode
                    ? Icons.wb_sunny_rounded
                    : Icons.nights_stay_rounded,
                size: 20,
                color: colorScheme.onSecondary,
              ),
              Switch(
                value: !themeProvider.isLightMode,
                onChanged: (value) => themeProvider.toggleTheme(),
                activeColor: colorScheme.tertiary,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              'welcome to Tech trivia a place where you can test your knowledge on everything tech',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
