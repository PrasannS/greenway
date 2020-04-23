import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(

          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: Color(0xFFB7B7B7).withOpacity(.16),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Counter(
                color: Colors.red,
                number: 1046,
                title: "CO2 Footprint",
              ),
              Counter(
                color: Color(0xFF36C12C),
                number: 46,
                title: "Lifespan",
              ),
            ],
          ),
      );
  }

}