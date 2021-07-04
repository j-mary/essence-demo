import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_demo_event.dart';
part 'bloc_demo_state.dart';

class BlocDemoBloc extends Bloc<BlocDemoEvent, BlocDemoState> {
  BlocDemoBloc() : super(BlocDemoState.initial());

  @override
  Stream<BlocDemoState> mapEventToState(
    BlocDemoEvent event,
  ) async* {
    BlocDemoState currentState = state;
    if (event is Increment) {
      yield currentState.copyWith(count: currentState.count + 1);
    }

    if (event is Decrement) {
      yield currentState.copyWith(
          count: currentState.count <= 0 ? 0 : currentState.count - 1);
    }

    if (event is Reset) {
      yield currentState.copyWith(count: 0);
    }
  }
}
