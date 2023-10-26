import 'dart:developer';

import 'package:aqary_test/features/4_sticky_header/logic/bloc/todo_bloc.dart';
import 'package:aqary_test/shared/enums/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

@immutable
class StickyHeaderScreen extends StatefulWidget {
  const StickyHeaderScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StickyHeaderScreen> createState() => _StickyHeaderScreenState();
}

class _StickyHeaderScreenState extends State<StickyHeaderScreen> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(const FetchTodoEvent());
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        log('load more');
        BlocProvider.of<TodoBloc>(context).add(const LoadMoreTodoEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.loadingStatus == LoadingStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            controller: controller,
            itemCount: (state.todoResponse?.todos?.length ?? 0) + 1,
            itemBuilder: (context, index) {
              if (index == state.todoResponse?.todos?.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              return StickyHeaderBuilder(
                builder: (BuildContext context, double stuckAmount) {
                  stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                  return Container(
                    height: 50.0,
                    color: Color.lerp(
                        Colors.blue[700], Colors.red[700], stuckAmount),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            state.todoResponse?.todos?[index].todo ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                content: Container(
                  color: Colors.grey[300],
                  child: ListTile(
                    title: CheckboxListTile(
                      title: const Text('Done'),
                      value:
                          state.todoResponse?.todos?[index].completed ?? false,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
