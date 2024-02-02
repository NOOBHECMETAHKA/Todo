import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/todo/presentation/controller/todo_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: switch (
          context.select<TodoContoller, TodoState>((value) => value.getState)) {
        TodoState.initial || TodoState.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        TodoState.success => ListView.builder(
            itemCount: context
                .select<TodoContoller, int>((value) => value.getList.length),
            itemBuilder: (context, index) {
              return TodoCard(
                index: index,
              );
            }),
        TodoState.error => null,
      },
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: Checkbox(
          onChanged: (value) {
            context.read<TodoContoller>().onChanged(value ?? false, index);
          },
          value: context.watch<TodoContoller>().getList[index].isCheck,
        ),
        title: Text(context.read<TodoContoller>().getList[index].name),
        children: [
          Text(context.read<TodoContoller>().getList[index].description)
        ],
      ),
    );
  }
}

class CustemAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustemAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Не выполнено: ${context.watch<TodoContoller>().getCountUnfinished}"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
