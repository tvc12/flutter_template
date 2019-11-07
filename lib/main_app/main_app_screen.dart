import 'package:flutter/material.dart';
import 'package:flutter_template/flutter_template.dart';

class MainAppSceen extends StatelessWidget {
  final MainAppBloc bloc;

  const MainAppSceen({@required this.bloc, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: blocBuilder(bloc),
    );
  }

  Widget blocBuilder(MainAppBloc bloc) {
    return BlocBuilder<MainAppBloc, MainAppState>(
      bloc: bloc,
      builder: (_, MainAppState state) {
        switch (state.runtimeType) {
          case InitMainAppState:
            return buildSplashScreen();
            break;
          case CompletedInitMainAppState:
            return SizedBox();
          default:
            return SizedBox();
        }
      },
    );
  }

  Widget buildSplashScreen() {
    const String url = 'https://github.com/tvc12.png';
    return Scaffold(
      backgroundColor: TColors.white,
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
