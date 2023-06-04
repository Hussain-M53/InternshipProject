import 'package:flutter/material.dart';
import 'package:internship/logout_button.dart';
import 'package:internship/theme_provider.dart';
import 'package:internship/tile_button.dart';
import 'package:provider/provider.dart';

import '../config/theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider tp, Widget? child) {
      return MaterialApp(
        title: 'Internship Project',
        debugShowCheckedModeBanner: false,
        theme: themeData(tp.theme),
        home: const MyHomePage(),
      );
    });
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
          secondary: theme.backgroundColor, primary: theme.primaryColor),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Consumer<ThemeProvider>(builder:
          (BuildContext context, ThemeProvider themeProvider, Widget? child) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (() {
                          themeProvider.setTheme();
                        }),
                        icon: Transform.rotate(
                          angle: -0.7,
                          child: Icon(
                              themeProvider.theme != ThemeConfig.darkTheme
                                  ? Icons.nightlight_outlined
                                  : Icons.wb_sunny,
                              size: 30,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 20, 0),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 152, 0),
                          width: 3.0,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 45,
                          color: Color.fromARGB(255, 255, 152, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "John Doe",
                      style: TextStyle(
                          color: (themeProvider.theme != ThemeConfig.darkTheme)
                              ? const Color.fromARGB(255, 34, 20, 0)
                              : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "john.doe@example.com",
                      style: TextStyle(
                          color: (themeProvider.theme != ThemeConfig.darkTheme)
                              ? const Color.fromARGB(255, 34, 20, 0)
                              : Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    MyButton(
                        textColor: const Color.fromARGB(255, 34, 20, 0),
                        buttonColor: const Color.fromARGB(255, 255, 152, 0),
                        buttonHeight: 45,
                        buttonText: "Upgrade to PRO",
                        buttonWidth: 200,
                        isOutlined: false,
                        isSubmitting: false,
                        borderRadius: 50,
                        buttonAction: () {},
                        buttonIcon: null),
                    const SizedBox(height: 25),
                    const TileButton(
                        text: "Privacy", prefix: Icons.privacy_tip_outlined),
                    const SizedBox(height: 15),
                    const TileButton(
                      text: "Purchase History",
                      prefix: Icons.history,
                    ),
                    const SizedBox(height: 15),
                    const TileButton(
                        text: "Help & Support", prefix: Icons.help_outline),
                    const SizedBox(height: 15),
                    const TileButton(
                        text: "Settings", prefix: Icons.settings_outlined),
                    const SizedBox(height: 15),
                    const TileButton(
                        text: "Invite a Friend",
                        prefix: Icons.person_add_outlined),
                    const SizedBox(height: 15),
                    MyButton(
                        textColor: Colors.white,
                        buttonColor: const Color.fromARGB(255, 33, 33, 33),
                        buttonHeight: 50,
                        buttonText: "Logout",
                        buttonWidth: 300,
                        isOutlined: false,
                        isSubmitting: false,
                        borderRadius: 22,
                        buttonAction: () {},
                        buttonIcon: null),
                  ]),
                ),
              ]),
        );
      }),
    );
  }
}
