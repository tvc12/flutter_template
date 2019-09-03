import 'package:bloc/bloc.dart';

class TBlocDelegate extends BlocDelegate {
  @override
  //ignore: always_specify_types
  void onEvent(final Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    // ignore: avoid_print 
    print('${bloc.runtimeType}: $event');
  }

  @override
  //ignore: always_specify_types
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // ignore: avoid_print 
    print('${bloc.runtimeType}: $transition');
  }

  @override
  //ignore: always_specify_types
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    // ignore: avoid_print 
    print(error);
    // ignore: avoid_print 
    print(stacktrace);
  }
}
