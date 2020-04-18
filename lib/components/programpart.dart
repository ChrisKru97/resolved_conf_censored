import 'package:flutter/material.dart';
import 'package:resolved_conf/data.dart';

class ProgramPart extends StatelessWidget {
  ProgramPart(this.program, {Key key}) : super(key: key);
  final PointOfProgram program;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue[900], width: 2)),
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  if (program.id != null) {
                    Navigator.of(context).pushNamed('/program/${program.id}');
                  }
                },
                child: Text(
                  program.name,
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color:
                          program.id != null ? Colors.blue[700] : Colors.black,
                      decoration: program.id != null
                          ? TextDecoration.underline
                          : TextDecoration.none),
                  textAlign: TextAlign.center,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Kdy:", style: Theme.of(context).textTheme.subtitle),
                Text(
                    program.endTime != null
                        ? '${program.startTime.format(context)} - ${program.endTime.format(context)}'
                        : program.startTime.format(context),
                    style: Theme.of(context).textTheme.display2)
              ],
            ),
            if (program.place != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Kde:", style: Theme.of(context).textTheme.subtitle),
                  GestureDetector(
                      child: Text(program.place,
                          style: program.marker != null
                              ? Theme.of(context).textTheme.button
                              : Theme.of(context).textTheme.display2),
                      onTap: () {
                        if (program.marker != null) {
                          Navigator.pushNamed(
                            context,
                            '/map/${program.marker}',
                          );
                        }
                      })
                ],
              ),
            if (program.speaker != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Řečník:", style: Theme.of(context).textTheme.subtitle),
                  GestureDetector(
                      child: Text(program.speaker.name,
                          style: Theme.of(context).textTheme.button),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/speaker/${program.speaker.id}',
                        );
                      })
                ],
              ),
            if (program.nonspeaker != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Program:", style: Theme.of(context).textTheme.subtitle),
                  Text(program.nonspeaker.name,
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
            if (program.theme != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Téma:", style: Theme.of(context).textTheme.subtitle),
                  Flexible(
                      child: Text(
                    program.theme,
                    style: Theme.of(context).textTheme.display2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ))
                ],
              ),
          ],
        ));
  }
}
