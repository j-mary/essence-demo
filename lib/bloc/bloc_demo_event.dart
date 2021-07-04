part of 'bloc_demo_bloc.dart';

@immutable
abstract class BlocDemoEvent {}

class Increment extends BlocDemoEvent {}

class Decrement extends BlocDemoEvent {}

class Reset extends BlocDemoEvent {}
