import 'package:flutter/material.dart';
import 'package:greenway/views/login_screen.dart';
import 'package:greenway/views/signup_screen.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int pageIndex = 0;
  List<Widget> pages = [LoginScreen(), SignupScreen()];
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: <Widget>[
          SizedBox(height: 40.0,),
          Row(
            children: <Widget>[
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    _pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
                  });
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: pageIndex == 0 ? FontWeight.bold
                          : FontWeight.w400,
                      decoration: pageIndex == 0 ? TextDecoration.underline
                          : TextDecoration.none
                  ),
                ),
              ),
              SizedBox(width: 250.0,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 1;
                    _pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                  });
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: pageIndex == 1 ? FontWeight.bold
                          : FontWeight.w400,
                      decoration: pageIndex == 1 ? TextDecoration.underline
                          : TextDecoration.none
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
            ],
          ),
          SizedBox(height: 15,),
          Expanded(
            child: PageView(
              children: pages,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),

            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
