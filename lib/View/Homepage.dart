import 'package:chitchat/Addons/ChatbotPremium.dart';
import 'package:chitchat/View/RightDrawer.dart';
import 'package:chitchat/View/chatScreen.dart';
import 'package:chitchat/View/homepagecards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CardWidget homecard = CardWidget();
  String name = "Varun Mehra";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 60),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/varunimg.png', // Replace with your image path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openEndDrawer();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              elevation: 4, // Adjust the elevation as needed
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.menu),
                            ),
                          )
                        ],
                      ),
                      Text("Hello,", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        
                      Text("$name!", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        
                    ],
                  ),
                ),
        
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ChatbotPremiumCard(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Discover the Methods and Get Advice with Confidence.!!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Dosis',
                ),
              ),
            ),
            Container(
              height: 190,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                 InkWell(onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chatbot()));
                 },child: homecard.Card1()),
                  homecard.Card2(),
                  homecard.Card3(),
                  homecard.Card4(),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(),
    );
  }
}
