import 'package:flutter/material.dart';
import 'package:nepal_corona_update/main.dart';
import 'dart:js' as js;

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      navigateToHome();
                    },),
                    ListTile(
                        title: Text(
                      "About",
                      style: TextStyle(fontFamily: "Poppins"),
                    ))
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
                                    onPressed: () {
                                      navigateToHome();
                                    },
                                    child: Text("Home",
                                        style: TextStyle(color: Color(0xffbfbfbf))),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      

                                    },
                                    child: Text("About",
                                        style: TextStyle(
                                            color: Colors.white)),
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
      body: aboutBody(),
      
    );
  }

  void navigateToHome(){
    Navigator.push(context, MaterialPageRoute(builder: (builder) => MyHomePage()));
  }



  Widget aboutBody(){
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width > 500 ?
                    50
                    : 40,
                    backgroundImage: AssetImage("web/assets/images/sujan.jpg"),
                  ),
                  SizedBox(
                    width:20
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sujan Pradhan",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: MediaQuery.of(context).size.width > 500 ?
                        28
                        : 24
                      ),
                      textAlign: TextAlign.left,),
                      Text("FullStack Mobile Developer \nUI/UX Designer",
                      style: TextStyle(
                        color: Color(0xffbfbfbf),
                        fontFamily: "Poppins",
                        fontSize: MediaQuery.of(context).size.width > 500 ?
                        18
                        : 14
                      ))
                    ],
                      
                    )

                ],

              ),
            ),
            SizedBox(
              height: 80
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap:(){
                    js.context.callMethod("open",["https://www.facebook.com/profile.php?id=100006478509243&ref=br_rs"]);

                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset("web/assets/images/facebook_icon.png")
                  ),
                ),
                SizedBox(width:60),
                InkWell(
                  onTap:(){
                    js.context.callMethod("open",["https://www.instagram.com/_sujanpradhan/"]);

                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Image.asset("web/assets/images/instagram_icon.png")
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
     
  }
}