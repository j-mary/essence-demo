import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_demo_bloc.dart';

class BlocDemo extends StatefulWidget {
  const BlocDemo({Key? key}) : super(key: key);

  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  // int value = 0;

  // handleIncrement() {
  //   setState(() {
  //     value = value + 1;
  //   });
  // }

  // handleDecrement() {
  //   setState(() {
  //     value = value <= 0 ? 0 : value - 1;
  //   });
  // }

  // handleReset() {
  //   setState(() {
  //     value = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocDemoBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Demo')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<BlocDemoBloc, BlocDemoState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.count}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => bloc.add(Increment()),
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () => bloc.add(Decrement()),
                      child: Text('Decrement'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(Reset()),
                  child: Text('Reset'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
