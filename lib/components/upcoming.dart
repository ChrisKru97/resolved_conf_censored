import 'package:flutter/material.dart';
import 'package:resolved_conf/components/programpart.dart';
import 'package:resolved_conf/data.dart';

class Upcoming extends StatelessWidget {
  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  List<PointOfProgram> getUpcoming(TimeOfDay timeNow) {
    DateOfConf upcomingDay = program.firstWhere((DateOfConf day) {
      return day.day.isAfter(DateTime.now().subtract(Duration(days: 1)));
    });
    return upcomingDay.program.where((PointOfProgram pop) {
      return toDouble(timeNow) < toDouble(pop.endTime ?? pop.startTime);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<PointOfProgram> upcomingPOPs = getUpcoming(TimeOfDay.now());
    if (upcomingPOPs.length == 0) {
      upcomingPOPs = getUpcoming(TimeOfDay(hour: 0, minute: 1));
    }
    List<PointOfProgram> upcomingPOP = upcomingPOPs.sublist(
        0, upcomingPOPs.length > 3 ? 3 : upcomingPOPs.length);
    return Padding(
        padding:
            EdgeInsets.fromLTRB(15, MediaQuery.of(context).padding.top, 15, 15),
        child: Column(
          children: <Widget>[
            Text(
              'Nadcházející',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height - 116,
                child: Material(
                    color: Color.fromRGBO(255, 255, 255, 0),
                    child: ListView.builder(
                      itemCount: upcomingPOP.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProgramPart(upcomingPOP.elementAt(index));
                      },
                    )))
          ],
        ));
  }
}
