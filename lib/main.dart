import 'package:essence_demo/bloc/bloc_demo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: BlocProvider(
  //       create: (context) => BlocDemoBloc(),
  //       child: BlocDemo(),
  //     ),
  //   );
  // }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final BlocDemoBloc _blocDemoBloc;

  @override
  void initState() {
    _createBloc();
    super.initState();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  void _createBloc() {
    _blocDemoBloc = BlocDemoBloc();
  }

  void _disposeBloc() {
    _blocDemoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDemoBloc>.value(value: _blocDemoBloc),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocDemo(),
      ),
    );
  }
}
