import 'package:flutter/material.dart';
import 'package:food_wheels/auth/signup.dart';
import 'package:food_wheels/custom_theme.dart';
import 'package:food_wheels/provider/provider.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListOfRecipes()),
        ChangeNotifierProvider(create: (_) => SavedProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const MyRegister(),
      );
    });
  }
}
