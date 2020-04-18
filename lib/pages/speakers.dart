import 'package:flutter/material.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;
import 'package:resolved_conf/data.dart';

class Speakers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Stack(children: <Widget>[
          Material(
              color: Color.fromRGBO(255, 255, 255, 0),
              child: ListView.builder(
                  itemCount: speakers.length,
                  itemBuilder: (BuildContext context, int index) {
                    SpeakerOfConf speaker = speakers.elementAt(index);
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/speaker/${speaker.id}');
                        },
                        child: Container(
                            color: index % 2 == 0
                                ? Colors.white.withOpacity(0.7)
                                : Colors.white.withOpacity(0),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                if (index % 2 != 0)
                                  Text(
                                    speaker.name,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('speaker_${speaker.id}.jpg'),
                                  radius: 40,
                                  backgroundColor: Colors.green[300],
                                ),
                                if (index % 2 == 0)
                                  Text(
                                    speaker.name,
                                    style: Theme.of(context).textTheme.subtitle,
                                  )
                              ],
                            )));
                  })),
          backButton.BackButton()
        ]));
  }
}
