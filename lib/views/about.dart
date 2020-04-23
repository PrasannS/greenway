import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
class About extends StatelessWidget {
  int carbon = 1046;
  int lifespan = 46;
  String carbontype = "bad";
  String life = "long";

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(

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
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " About your Item",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Google'
                ),
              ),
              Text(
                "More details ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your item has a C02 Footprint of "
                  + carbon.toString() +
                  " and has a lifespan of "
                  + lifespan.toString() +
                " years. The item is "
                  + carbontype +
                  " for the environment, and will last for a "
                  + life +
                  " time.",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Google',
              ),
            ),
          )
        ],
      );
  }

}