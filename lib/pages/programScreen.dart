import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resolved_conf/components/program.dart';
import 'package:resolved_conf/data.dart';
import 'package:resolved_conf/components/upcoming.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;

class ProgramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          color: Colors.white.withOpacity(0.9),
          child: CarouselSlider(
            items: <Widget>[
              Upcoming(),
              Program(
                dateOfConf: program.elementAt(0),
                label: 'Pátek',
              ),
              Program(
                dateOfConf: program.elementAt(1),
                label: 'Sobota',
              ),
              Program(
                dateOfConf: program.elementAt(2),
                label: 'Neděle',
              ),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enableInfiniteScroll: false,
            ),
          )),
      backButton.BackButton()
    ]);
  }
}
