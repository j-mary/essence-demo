part of 'cubit_demo_cubit.dart';

@immutable
class CubitDemoState {
  final int count;

  CubitDemoState({required this.count});

  factory CubitDemoState.initial() {
    return CubitDemoState(count: 0);
  }

  CubitDemoState copyWith({
    int? count,
  }) {
    return CubitDemoState(
      count: count ?? this.count,
    );
  }
}