import 'package:flutter/material.dart';
import 'package:greenway/api_client/api_client.dart';
import 'package:greenway/models/footprint_result.dart';
import 'package:greenway/models/shop_result.dart';
import 'package:greenway/models/web_result.dart';
import 'package:greenway/screens/shop.dart';
import 'package:greenway/views/resource_screen.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'about.dart';
import 'videos_page.dart';

class Details extends StatefulWidget {
  final String item;

  const Details({Key key, this.item}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();

}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin{
  TabController _tabController;
  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);
    getData();
  }

  List<ShopResult> shopresults = [];
  List<WebResult> webresults =[];
  FootprintResult footprintResult;

  bool shoploaded = false;
  bool webloaded = false;
  bool fploaded = false;

  Future getData() async{
    print("STARTED");
    await fetchFootprintResult(widget.item).then((value){
      print("ENTERED SOMEWHERE");
      setState(() {
        footprintResult = value;
        fploaded = true;
        print("FOOTPRINT RESULT"+footprintResult.toString());
        print(fploaded);
        print("FINISHED");
      });
    });
    await fetchShopResult(widget.item).then((value) {
      setState(() {
        shopresults = value;
        shoploaded = true;
      });
    });
    await fetchWebResult(widget.item).then((value){
      setState(() {
        webresults = value;
        webloaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Flexible(
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
            )
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: [
          fploaded?About(carbon: footprintResult.value.floor(),lifespan: 78 , carbontype: "bad",life: "bad",description:footprintResult.description ,):Center(child: CircularProgressIndicator()),
          VideosPage(),
          webloaded?ResourcesPage(webresu: webresults,):Center(child: CircularProgressIndicator()),
          shoploaded?ShopPage(shops: shopresults,):Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

}