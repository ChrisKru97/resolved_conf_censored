import 'package:flutter/material.dart';

class CardWidget {
  String name;
  String label;

  CardWidget(this.name, this.label);
}

class MenuScreen extends StatelessWidget {
  static double borderRadius = 12;

  static List<CardWidget> data = <CardWidget>[
    CardWidget('program', 'Program'),
    CardWidget('speakers', 'Řečníci'),
    CardWidget('map', 'Mapa'),
    CardWidget('contacts', 'Kontakty')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Material(
            color: Color.fromRGBO(255, 255, 255, 0),
            child: Column(
                children: data.map((CardWidget widget) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/${widget.name}');
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('${widget.name}.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.label,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      )));
            }).toList())));
  }
}
