import 'package:flutter/material.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScrennState createState() => _MainScrennState();
}

class _MainScrennState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ApiClient.getListaDisciplinas(1);
    return Scaffold(
      drawer: Components.getDrawer(context),
      appBar: Components.getAppBar('Principal'),
    );
  }
}
