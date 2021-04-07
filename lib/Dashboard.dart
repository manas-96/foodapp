import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddemo/DashboardScreens/Bag.dart';


import 'DashboardScreens/AllProduct.dart';
import 'DashboardScreens/Home.dart';
import 'DashboardScreens/Profile.dart';
import 'helper.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  //check?Navigator.pop(context):
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        });
  }
  final List<Widget> _children = [
    Home(),
    Profile()
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onBackPressed,
      child: Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          splashColor: white,
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bag()));
          },
          tooltip: 'Bag',
          child: Icon(Icons.shopping_bag,color: white,),
          elevation: 10.0,
        ),
        body: _children[_currentIndex],


        bottomNavigationBar:  BottomAppBar(
          elevation: 10,
          color: white,
          notchMargin: 6.0,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(

          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // backgroundColor: white,
              icon: new Icon(Icons.home,),
              title: new Text('Home',style: TextStyle(fontSize: 13,color: white),),
            ),

            BottomNavigationBarItem(

                icon: Icon(Icons.person),
                title: Text('Profile',style: TextStyle(fontSize: 13,color: white),)),

          ],
        ),
        )
      ),
    );
  }
}
