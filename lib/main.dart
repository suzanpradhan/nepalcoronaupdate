import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nepal_corona_update/api_methods.dart';
import 'package:nepal_corona_update/models/covid_model.dart';
import 'package:nepal_corona_update/resonsive_screens/about_page.dart';
import 'package:nepal_corona_update/resonsive_screens/responsive_mob.dart';
import 'package:nepal_corona_update/resonsive_screens/responsive_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Covid-19 Update',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<OverviewModel> overViewData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    overViewData = ApiMethods().coronaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: MediaQuery.of(context).size.width < 800
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                        title: Text(
                      "Home",
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    onTap: (){
                      navigateToAbout();
                    },
                    ),
                    ListTile(
                        title: Text(
                      "About",
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    onTap: (){
                      navigateToAbout();
                    },)
                  ],
                ),
              )
            : null,
        backgroundColor: Color(0xff0d0d0d),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            child: AppBar(
              backgroundColor: Color(0xff0d0d0d),
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Covid-19 Update Nepal",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        MediaQuery.of(context).size.width > 800
                            ? Row(
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text("Home",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      navigateToAbout();
                                    },
                                    child: Text("About",
                                        style: TextStyle(
                                            color: Color(0xffbfbfbf))),
                                  )
                                ],
                              )
                            : Text("")
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
        body: homeBody()
    );
  }

  void navigateToAbout(){
    Navigator.push(context, MaterialPageRoute(builder: (builder) => AboutPage()));
  }

  Widget homeBody() {
    return MediaQuery.of(context).size.width > 1000 ? ResponsiveWeb() : MobileResponsive();
  }
}
