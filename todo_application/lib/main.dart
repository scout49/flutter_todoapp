import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/page/MainTabPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ProviderScope(
    child: MyTodoApp()
  ));
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({
    Key? key,
    }): super(key: key);



  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        useMaterial3: true
      ),

      home: const Scaffold(
      body : MainTabPage(),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ja")
      ],
      routes: {
        '/tab': (context) => const MainTabPage(),
      },
    );

  }

}

