import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit_demo_cubit.dart';

class CubitDemo extends StatefulWidget {
  const CubitDemo({Key? key}) : super(key: key);

  @override
  _CubitDemoState createState() => _CubitDemoState();
}

class _CubitDemoState extends State<CubitDemo> {
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
    final bloc = BlocProvider.of<CubitDemoCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cubit Demo')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<CubitDemoCubit, CubitDemoState>(
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
                      onPressed: () => bloc.increment(),
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () => bloc.decrement(),
                      child: Text('Decrement'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => bloc.reset(),
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
