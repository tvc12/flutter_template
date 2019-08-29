import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ddi/di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/bloc_delegate.dart';
import 'package:flutter_template/module/dev_module.dart';
import 'package:t_core/t_core.dart';

void main() {
  if (kReleaseMode) {
    Config.init(Mode.Production);
    DI.init([DevModule()]);
  } else {
    Config.init(Mode.Debug);
    DI.init([DevModule()]);
  }
  FlutterError.onError = (FlutterErrorDetails error) {
    print(error);
    FlutterError.dumpErrorToConsole(error);
    Zone.current.handleUncaughtError(error.exception, error.stack);
  };
  runApp(buildApp());
}

Widget buildApp() {
  BlocSupervisor.delegate = TBlocDelegate();
  return SizedBox();
}
