import 'package:flutter/cupertino.dart';

abstract class TelaBase extends InheritedWidget{

  final Widget child;
  Widget appBar;
  String nomeApp = "PuQuizz";

  TelaBase(this.appBar, {Key key, this.child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TelaBase of(BuildContext context) => context.inheritFromWidgetOfExactType(TelaBase);

}