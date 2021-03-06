import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenway/views/entry_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:avatar_glow/avatar_glow.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final onboardPages = [
      Container(color: Colors.pinkAccent, child: FirstScreen()),
      Container(
        color: Colors.blueAccent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: skipButton(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Container(
                      height: 340,
                      width: 10,
                      child: Image(
                        image: AssetImage('assets/images/PleaseWork.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text('Become more eco friendly',
                                style: TextStyle(
                                    fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                            Text(
                              'from the comfort of your home!',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          ],
                        )),
                  ),
                ]))),
      ),
      Container(
        color: Colors.deepPurpleAccent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: skipButton(context),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/Improvement.png'),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Learn new ways to imrpove your lifestyle',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ),
                    ),
                  ),
                ]))),
      ),
      Container(
        color: Colors.blueAccent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: skipButton(context),
                  ),
                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/EcoWorld.png',
                      height: 300,
                      width: 200,
                    )
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Text(
                          'Combat climate change',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                        Text(
                          'just one step at a time',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ]),
                    ),
                  ),
                ]))),
      ),
      Container(
        child: FinalScreen(),
      )
    ];
    return Scaffold(
        body: LiquidSwipe(
      pages: onboardPages,
      fullTransitionValue: 400,
      enableLoop: true,
      enableSlideIcon: false,
      //positionSlideIcon: 0.8,
      waveType: WaveType.liquidReveal,
    ));
  }

  Widget skipButton(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EntryScreen()),
        );
      },
      child: Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 150,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 25.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: FlutterLogo(
                            size: 100.0,
                          ),
                          radius: 100.0,
                        )),
                  ),
                  //SizedBox(height: 100,),
                  Center(
                    child: Text(
                      'Start your greenway today',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 40,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EntryScreen()),
                      );
                    },
                  )
                ])));
  }
}

class FirstScreen extends StatefulWidget {
  final String title;

  FirstScreen({Key key, this.title}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  // Whether the green box should be visible
  bool _buttonVisible = true;
  bool _textVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Stack(
            children: <Widget>[
              Center(
                // The green box must be a child of the AnimatedOpacity widget.
                child: Container(
                  child: Text(
                    'Welcome to Greenway',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
