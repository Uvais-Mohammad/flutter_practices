import 'package:aqary_test/features/2_asynchronous_generator_with_transformer/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Concurrency counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Click the button below to add some events and see the state change. Here transformer is sequential, so events will be processed one by one.'),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.value}',
                  style: const TextStyle(fontSize: 30, color: Colors.red),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterDecrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterDecrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterIncrement(),
                  );
              context.read<CounterBloc>().add(
                    CounterDecrement(),
                  );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
