import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/presentation/controller/todo_controller.dart';
import 'package:todo/features/todo/presentation/ui/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoContoller()..init(),
      child: const Home(),
    );
  }
}
