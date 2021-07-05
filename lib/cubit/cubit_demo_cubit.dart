import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_demo_state.dart';

class CubitDemoCubit extends Cubit<CubitDemoState> {
  CubitDemoCubit() : super(CubitDemoState.initial());

  increment() {
    emit(state.copyWith(count: state.count + 1));
  }

  decrement() {
    emit(state.copyWith(count: state.count <= 0 ? 0 : state.count - 1));
  }

  reset() {
    emit(state.copyWith(count: 0));
  }
}
