import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log("Cubit ${bloc.runtimeType} is created");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("Cubit ${bloc.runtimeType} state Changing [ ${change.currentState.runtimeType} -> ${change.nextState.runtimeType} ]");
    
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("Cubit ${bloc.runtimeType} closed");
  }
}
