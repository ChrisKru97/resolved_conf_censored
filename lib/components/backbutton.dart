import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  BackButton({Key key, this.centered = false}) : super(key: key);
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        right: centered ? null : 50,
        child: Material(
            color: Color.fromRGBO(255, 255, 255, 0),
            child: Ink(
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 1),
                border: Border.all(color: Colors.black, width: 3.0),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.chevron_left,
                    size: 36.0,
                    color: Colors.black,
                  ),
                ),
              ),
            )));
  }
}
