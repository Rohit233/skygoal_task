import 'package:flutter/material.dart';
import 'package:skygoal_task/pages/home_screen.dart';
import 'package:skygoal_task/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.primaryColorTheme),

        //* TEXT THEME 
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold
          ),
          bodySmall: TextStyle(
            color: Colors.grey
          ),
          bodyMedium: TextStyle(
            color: Colors.grey
          ),
          bodyLarge: TextStyle(
            color: Colors.grey
          )
        ),

        //* ICON THEME 
        iconTheme: IconThemeData(
          color: Constants.primaryColorTheme
        ),

        //* ICON BUTTON THEME 
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Constants.primaryColorTheme
          )
        ),

        //* LIST TILE THEME 
        listTileTheme: const ListTileThemeData(
          titleTextStyle: TextStyle(
            color: Colors.black,
          )
        ),

        //* ELEVATED BUTTON THEME 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Constants.primaryColorTheme,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            )
          )
        ),

        //* BOTTOM NAVIGAION BAR THEME
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Constants.primaryColorTheme,
          selectedIconTheme: const IconThemeData(
            color: Colors.white
          ),
          selectedItemColor: Colors.white,
          unselectedIconTheme: const IconThemeData(
            color: Colors.white30
          ),
          unselectedItemColor: Colors.white30
        ),

        //* NAVIGATION BAR THEME 
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Constants.primaryColorTheme,
          indicatorColor: Colors.white,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Colors.white
          ))
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}

