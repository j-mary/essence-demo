import 'package:essence_demo/bloc/bloc_demo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit_demo_cubit.dart';
import 'cubit_demo.dart';

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
  late final CubitDemoCubit _cubitDemoCubit;

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
    _cubitDemoCubit = CubitDemoCubit();
  }

  void _disposeBloc() {
    _blocDemoBloc.close();
    _cubitDemoCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDemoBloc>.value(value: _blocDemoBloc),
        BlocProvider<CubitDemoCubit>.value(value: _cubitDemoCubit),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: WebViewExample()
        // home: BlocDemo(),
        home: CubitDemo(),
      ),
    );
  }
}
