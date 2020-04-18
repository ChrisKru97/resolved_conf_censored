import 'package:flutter/material.dart';
import 'package:resolved_conf/components/programpart.dart';
import 'package:resolved_conf/data.dart';

class Program extends StatelessWidget {
  Program({Key key, this.dateOfConf, this.label}) : super(key: key);
  final DateOfConf dateOfConf;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(15, MediaQuery.of(context).padding.top, 15, 15),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height - 124,
                child: Material(
                    color: Color.fromRGBO(255, 255, 255, 0),
                    child: ListView.builder(
                      itemCount: dateOfConf.program.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProgramPart(dateOfConf.program.elementAt(index));
                      },
                    )))
          ],
        ));
  }
}
