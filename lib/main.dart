import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resolved_conf/data.dart';
import 'package:resolved_conf/menu.dart';
import 'package:resolved_conf/pages/contacts.dart';
import 'package:resolved_conf/pages/programPoint.dart';
import 'package:resolved_conf/pages/programScreen.dart';
import 'package:resolved_conf/pages/map.dart' as map;
import 'package:resolved_conf/pages/speaker.dart';
import 'package:resolved_conf/pages/speakers.dart';
import 'package:resolved_conf/splash.dart';

final router = Router();

Handler splashHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SplashScreen();
});
Handler homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MenuScreen();
});
Handler speakerHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Speaker(speakers.elementAt(int.parse(params['id'][0])));
});
Handler mapHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return map.Map(
      initialPosition: CameraPosition(
          target: markers
              .elementAt(
                  params.containsKey('id') ? int.parse(params['id'][0]) : 0)
              .position,
          zoom: 17,
          bearing: 320));
});
Handler speakersHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Speakers();
});
Handler programHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ProgramScreen();
});
Handler programPointHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ProgramPoint(pointsWithDesc.elementAt(int.parse(params['id'][0])));
});
Handler contactsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Contacts();
});

void defineRoutes(Router router) {
  router.define("/",
      handler: splashHandler, transitionType: TransitionType.fadeIn);
  router.define("/home",
      handler: homeHandler, transitionType: TransitionType.inFromRight);
  router.define("/map",
      handler: mapHandler, transitionType: TransitionType.inFromRight);
  router.define("/map/:id",
      handler: mapHandler, transitionType: TransitionType.inFromRight);
  router.define("/speakers",
      handler: speakersHandler, transitionType: TransitionType.inFromRight);
  router.define("/program",
      handler: programHandler, transitionType: TransitionType.inFromRight);
  router.define("/speaker/:id",
      handler: speakerHandler, transitionType: TransitionType.inFromRight);
  router.define("/program/:id",
      handler: programPointHandler, transitionType: TransitionType.inFromRight);
  router.define("/contacts",
      handler: contactsHandler, transitionType: TransitionType.inFromRight);
}

void main() {
  defineRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konference Resolved',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Nunito',
          textTheme: TextTheme(
              title: TextStyle(
                fontSize: 40,
                decoration: TextDecoration.underline,
              ),
              subtitle: TextStyle(
                fontSize: 18,
              ),
              subhead: TextStyle(fontSize: 24, color: Colors.white),
              display1: TextStyle(color: Colors.black,fontSize: 24),
              display2: TextStyle(
                fontSize: 14,
              ),
              button: TextStyle(
                  color: Colors.blue[700],
                  decoration: TextDecoration.underline))),
      initialRoute: '/',
      onGenerateRoute: router.generator,
    );
  }
}
