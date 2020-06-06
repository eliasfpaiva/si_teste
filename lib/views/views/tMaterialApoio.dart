import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_teste/models/MaterialApoio.dart';
import 'package:si_teste/services/apiClient.dart';
import 'package:si_teste/views/widgets/components.dart';
import 'package:link/link.dart';


class TMaterialApoio extends StatefulWidget {
  @override
  _TMaterialApoioState createState() => _TMaterialApoioState();
}

class _TMaterialApoioState extends State<TMaterialApoio> {

  List<String> fetchPost;
  List<bool> _isExpanded;

  Future<List<MaterialApoio>> loadData() async {
    await Future.delayed(Duration(seconds: 1));
    return ApiClient.getMateriaisApoio();
  }

  void expandList(int length) {
    if (_isExpanded == null) {
      _isExpanded = new List(length);
      _isExpanded.fillRange(0, length - 1, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Future<List<MaterialApoio>> materiais = ApiClient.getMateriaisApoio(8);
    return Scaffold(
      appBar: Components.getAppBar('Material de Apoio'),
      body: Container(
        child: FutureBuilder<List<MaterialApoio>>(
          future: loadData(),
          builder: (context, response) {
            if (response.hasData) {
              expandList(response.data.length); //initialize the expand list
              return SingleChildScrollView(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 500),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _isExpanded[index] = !isExpanded;
                      //print("INDEX : $index ... $isExpanded");
                    });
                  },
                  children: buildPanelList(response.data)
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        )
      ),
    );
  }

  List<ExpansionPanel> buildPanelList(List<MaterialApoio> data) {
    List<ExpansionPanel> children = List<ExpansionPanel>();
    for (int i = 0; i < data.length; i++) {
      children.add(
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset('lib/assets/iconBook.png'),
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  child: Center(
                    child : Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data[i].nome,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20, 
                          color: Colors.blueGrey
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          isExpanded: _isExpanded[i] ?? false,
          body: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                data[i].texto,
                textAlign: TextAlign.left,
              ),
            ),
            /*Container(
              child: Center(
                child: Link(
                  url: data[i].link, 
                  child: Text(
                    data[i].link, 
                    style: TextStyle(
                      decoration: TextDecoration.underline, 
                      color: Colors.blue
                    ),
                  )
                ),
              ),
            )*/
        )
      );
    }
    return children;
  }
}
