import 'package:flutter/material.dart';
import 'package:resolved_conf/data.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;

class ProgramPoint extends StatelessWidget {
  ProgramPoint(this.pointOfProgram, {Key key}) : super(key: key);
  final PointOfProgram pointOfProgram;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(pointOfProgram.name,
                          style: Theme.of(context).textTheme.title),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Kdy:",
                              style: Theme.of(context).textTheme.display1),
                          Text(
                              pointOfProgram.endTime != null
                                  ? '${pointOfProgram.startTime.format(context)} - ${pointOfProgram.endTime.format(context)}'
                                  : pointOfProgram.startTime.format(context),
                              style: Theme.of(context).textTheme.display2)
                        ],
                      ),
                      if (pointOfProgram.place != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Kde:",
                                style: Theme.of(context).textTheme.display1),
                            GestureDetector(
                                child: Text(pointOfProgram.place,
                                    style: Theme.of(context).textTheme.button),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/map/${pointOfProgram.marker}',
                                  );
                                })
                          ],
                        ),
                      if (pointOfProgram.speaker != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Řečník:",
                                style: Theme.of(context).textTheme.display1),
                            GestureDetector(
                                child: Text(pointOfProgram.speaker.name,
                                    style: Theme.of(context).textTheme.button),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/speaker/${pointOfProgram.speaker.id}',
                                  );
                                })
                          ],
                        ),
                      if (pointOfProgram.nonspeaker != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Program:",
                                style: Theme.of(context).textTheme.display1),
                            Text(pointOfProgram.nonspeaker.name,
                                style: Theme.of(context).textTheme.display2),
                          ],
                        ),
                      if (pointOfProgram.theme != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Téma:",
                                style: Theme.of(context).textTheme.display1),
                            Flexible(
                                child: Text(
                              pointOfProgram.theme,
                              style: Theme.of(context).textTheme.display2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                            ))
                          ],
                        ),
                    ],
                  ),
                  if (pointOfProgram.description != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Popis:",
                            style: Theme.of(context).textTheme.display1),
                        ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height / 4,
                            ),
                            child: SingleChildScrollView(
                                child: Text(
                              pointOfProgram.description,
                              style: Theme.of(context).textTheme.display2,
                            )))
                      ],
                    )
                ],
              )),
          backButton.BackButton()
        ]));
  }
}
