import 'package:flutter/material.dart';
import 'package:resolved_conf/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;

class Speaker extends StatelessWidget {
  Speaker(this.speaker, {Key key}) : super(key: key);
  final SpeakerOfConf speaker;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Stack(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'speaker_${speaker.id}.jpg',
                      )),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(speaker.name,
                        style: Theme.of(context).textTheme.title),
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 4,
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          speaker.description,
                          style: Theme.of(context).textTheme.body2,
                          textAlign: TextAlign.justify,
                        ),
                      )),
                  if (speaker.url != null)
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Material(
                            color: Color.fromRGBO(255, 255, 255, 0),
                            child: GestureDetector(
                                onTap: () {
                                  launchURL(speaker.url);
                                },
                                child: Text(
                                  'Ostatní kázání',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(fontSize: 18),
                                ))))
                ],
              )),
          backButton.BackButton()
        ]));
  }
}
