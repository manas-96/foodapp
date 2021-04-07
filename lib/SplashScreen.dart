import 'package:flutter/material.dart';

import 'AuthScreen/Signin.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this, value: 0.0);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.forward();
    _animation..addListener((){
        setState(() {

        });
      })
      ..addStatusListener((status){

        if(_controller.isCompleted){
          setState(() {
            route();
          });
        }
        else if(_controller.isDismissed){
          _controller.forward();
        }
      });

    super.initState();
  }
  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  route()async{
    Future.delayed(const Duration(seconds: 1), () {
      checkLogin();
    });
  }
  checkLogin()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ]
          )
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //     image: AssetImage("images/logo.png"),fit: BoxFit.fill
                  // )
              ),
              alignment: Alignment.center,
              child: Text("LOGO",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),

            ),
          ),
        ),
      ),
    );
  }
}
