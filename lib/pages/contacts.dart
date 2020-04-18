import 'package:flutter/material.dart';
import 'package:resolved_conf/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resolved_conf/components/backbutton.dart' as backButton;

class Contacts extends StatelessWidget {
  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    List<Contact> actualContacts = contacts.where((Contact contact) {
      if (contact.inTime == null) {
        return true;
      } else if (contact.inTime) {
        if (!contact.day.isAfter(DateTime.now()) &&
            toDouble(TimeOfDay.now()) > toDouble(contact.startTime) &&
            toDouble(TimeOfDay.now()) < toDouble(contact.endTime)) {
          return true;
        } else {
          return false;
        }
      } else {
        if (!contact.day.isAfter(DateTime.now()) &&
            toDouble(TimeOfDay.now()) > toDouble(contact.startTime) &&
            toDouble(TimeOfDay.now()) < toDouble(contact.endTime)) {
          return false;
        } else {
          return true;
        }
      }
    }).toList();
    return Container(
        color: Colors.white.withOpacity(0.9),
        child: Stack(children: <Widget>[
          Material(
              color: Color.fromRGBO(255, 255, 255, 0),
              child: ListView.builder(
                  itemCount: actualContacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact contact = actualContacts.elementAt(index);
                    return Container(
                        color: index % 2 == 0
                            ? Colors.white.withOpacity(0.7)
                            : Colors.white.withOpacity(0),
                        height: 150,
                        padding: EdgeInsets.all(35),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                contact.function,
                                style: Theme.of(context).textTheme.headline,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    contact.name,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        launch('tel:' + contact.number);
                                      },
                                      child: Text(
                                        contact.number,
                                        style:
                                            Theme.of(context).textTheme.button,
                                      )),
                                ],
                              )
                            ]));
                  })),
          backButton.BackButton()
        ]));
  }
}
