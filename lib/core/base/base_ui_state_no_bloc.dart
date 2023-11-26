import 'package:flutter/material.dart';

abstract class BaseUiStateNoBloc<S extends StatefulWidget> extends State<S> {

  push<T>(String name) => Navigator.of(context).pushNamed<T>(name);

  pop() => Navigator.of(context).pop();

  showLoadingDialog(){

  }

  closeLoadingDialog(){

  }
}
