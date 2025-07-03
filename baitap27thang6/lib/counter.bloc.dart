import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementCounterEvent>((event, emit) {
      final currentState = state;
      emit(CounterState(state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      final currentState = state;
      emit(CounterState(state.counter - 1));
    });
  }
}
