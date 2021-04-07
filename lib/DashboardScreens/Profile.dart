import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddemo/DashboardScreens/Order/OrderList.dart';

import '../helper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id="";
  String name="Manas Saha";
  String email="manas96saha@gmail.com";
  String mobile="7407551277";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor,width: 1),
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:  AssetImage("images/p.jpg"),fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text(name,style: TextStyle(fontFamily: 'Fancy', fontWeight: FontWeight.w500,fontSize: 17,color: Colors.white),),
                          Text(email,style: TextStyle(fontFamily: 'Fancy', fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),),
                        ],
                      ),
                    )
                  ),

                  SizedBox(height: 30,),
                  Container(width: MediaQuery.of(context).size.width*0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 4,),
                          InkWell(
                            onTap: (){

                            },
                            child: ListTile(
                              title: Text("Update account",style: TextStyle(color: Colors.black,fontFamily: 'regular',fontWeight: FontWeight.w500,fontSize: 17),),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),

                          Divider(thickness: 1,color: color1),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){

                            },
                            child: ListTile(
                              title: Text("View Address",style: TextStyle(color: Colors.black,fontFamily: 'regular',fontWeight: FontWeight.w500,fontSize: 17),),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          Divider(thickness: 1,color: color1),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderList()));
                            },
                            child: ListTile(
                              title: Text("Order Management",style: TextStyle(color: Colors.black,fontFamily: 'regular',fontWeight: FontWeight.w500,fontSize: 17),),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          Divider(thickness: 1,color: color1),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){

                            },
                            child: ListTile(
                              title: Text("Change Password",style: TextStyle(color: Colors.black,fontFamily: 'regular',fontWeight: FontWeight.w500,fontSize: 17),),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          Divider(thickness: 1,color: color1),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                             
                            },
                            child: ListTile(
                              title: Text("Log Out",style: TextStyle(color: Colors.black,fontFamily: 'regular',fontWeight: FontWeight.w500,fontSize: 17),),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ),
                          Divider(thickness: 1,color: color1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
  String img="";

}
