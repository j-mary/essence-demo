part of 'bloc_demo_bloc.dart';

@immutable
class BlocDemoState {
  final int count;

  BlocDemoState({required this.count});

  factory BlocDemoState.initial() {
    return BlocDemoState(count: 0);
  }

  BlocDemoState copyWith({
    int? count,
  }) {
    return BlocDemoState(
      count: count ?? this.count,
    );
  }
}
