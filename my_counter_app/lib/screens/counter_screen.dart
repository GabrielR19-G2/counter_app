import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_app/screens/bloc/counter_bloc.dart';
import 'package:my_counter_app/screens/bloc/counter_event.dart';
import 'package:my_counter_app/screens/bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "My Counter app",
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gradient.jpg'), fit: BoxFit.cover)),
          child: BlocProvider(
            create: (context) => CounterBloc(),
            child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) => Column(
                      children: [
                        SizedBox(
                          height: size.height / 12,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            color: const Color.fromARGB(255, 152, 189, 191),
                            height: size.height / 4,
                            width: size.width / 1.5,
                            child: Column(
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: size.width / 12,
                                      height: size.height / 24,
                                      decoration: BoxDecoration(
                                          color: state.ledColor,
                                          border: Border.all(
                                              color: state.ledColor, width: 3),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  ),
                                  const Text("Counter value:",
                                      style: TextStyle(fontSize: 20))
                                ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: size.height / 12,
                                      width: size.width / 12,
                                      alignment: Alignment.center,
                                      child: Text('${state.counterValue}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height / 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.remove_circle_outline,
                                      color: Colors.white, size: 40),
                                  onPressed: () {
                                    context.read<CounterBloc>().add(
                                        DecrementCounter(
                                            state.counterValue ?? 0));
                                  }),
                              IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    context.read<CounterBloc>().add(
                                        IncrementCounter(
                                            state.counterValue ?? 0));
                                  }),
                            ],
                          ),
                        )
                      ],
                    )),
          ),
        ),
      ),
    ]);
  }
}
