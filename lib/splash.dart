import 'dart:ui' as dartUi;
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white70,
        ),
        Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('background.jpg'),
                  fit: BoxFit.cover,
                )),
                child: BackdropFilter(
                  filter: dartUi.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.grey[100].withOpacity(0.3),
                    ),
                  ),
                )),
            Image.asset(
              'splash.jpg',
            ),
          ],
        ),
        Positioned(
            bottom: 50,
            child: Material(
                color: Color.fromRGBO(255, 255, 255, 0),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 3.0),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.chevron_right,
                        size: 36.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                )))
      ],
    );
  }
}
