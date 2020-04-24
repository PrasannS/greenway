import 'package:flutter/material.dart';
import 'package:greenway/models/footprint_result.dart';
import 'package:greenway/models/shop_result.dart';
import 'package:greenway/models/web_result.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'about.dart';
import 'videos_page.dart';
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();

}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin{
  TabController _tabController;
  PageController _pageController;
  ReactionDisposer _disposer;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);


  }

  List<ShopResult> shopresults = [];
  List<WebResult> webresults =[];
  FootprintResult footprintResult;

  bool shoploaded = false;
  bool webloaded = false;
  bool fploaded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Observer(builder: (context) {
            return Flexible(
              child: TabBar(
                onTap: (index) {
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300)
                      , curve: Curves.easeInOut);
                },
                controller: _tabController,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.lightGreen,
                unselectedLabelColor: Color(0xff5f6368),
                isScrollable: true,
                indicator: MD2Indicator(
                    indicatorHeight: 4,
                    indicatorColor: Colors.lightGreen,
                    indicatorSize: MD2IndicatorSize.full
                ),
                tabs: [
                  Tab( text: "About",),
                  Tab( text: "Videos",),
                  Tab(text: "Resources",),
                  Tab( text: "Shop",),
                ],
              ),
            );
          }),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: [
          About(carbon: 1042,lifespan: 100 , carbontype: "bad",life: "bad",description:"Hello" ,),
          VideosPage(),
        ],
      ),
    );
  }

}