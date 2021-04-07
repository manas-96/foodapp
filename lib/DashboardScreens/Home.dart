import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddemo/widgets/Banners.dart';
import 'package:fooddemo/widgets/Caterories.dart';
import 'package:fooddemo/widgets/Products.dart';


import '../helper.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search="";
  String name="Manas";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.white24,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appbarColor,
        // title: Container(
        //   height: 40,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("images/hem-logo.png"),fit: BoxFit.fill
        //     )
        //   ),
        // ),
        title: Text("LOGO",style: TextStyle(color: color2),),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,),
            onPressed: (){

            },
          ),
          SizedBox(width: 8,)
        ],
      ),
      body: Container(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Text("Hello ${name==null ? "There":name} !",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black54),),
              Text("Order your favorite Foods",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black54)),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: w,
                padding: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Theme.of(context).primaryColor)
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "search",
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      prefixIcon: Icon(Icons.search_outlined,color: Theme.of(context).primaryColor,)
                  ),
                  onChanged: (val){
                    search=val;
                  },
                  onFieldSubmitted: (val){
                    if(search==""){

                    }
                    else{
                      print(search);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult(
                      //   name: search,
                      // )));
                    }
                  },

                ),
              ),
              SizedBox(height: 20,),
              Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black54),),
              SizedBox(height: 10,),
              Categories(),
              SizedBox(height: 20,),
              Banners(),
              SizedBox(height: 20,),
              Container(
                width: w,
                child: Products(title: "Non-Veg items",),
              ),
              SizedBox(height: 15,),
              //Brands(),
              SizedBox(height: 15,),
              Container(
                width: w,
                child: Products(title: "Fruits",),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
