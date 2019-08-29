import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/bloc_delegate.dart';

void main() {
  if (kReleaseMode) {
  } else {}
  runApp(buildApp());
}

Widget buildApp() {
  BlocSupervisor.delegate = TBlocDelegate();
  return SizedBox();
}
