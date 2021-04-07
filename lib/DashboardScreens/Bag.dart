import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddemo/data.dart';

class Bag extends StatefulWidget {
  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 102,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    SizedBox(height: 30,),
                    products(),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.local_offer),
                        title: Text("APPLY COUPON",style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bill Details",style: TextStyle(
                              color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width-30,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Item total",style: TextStyle(fontSize: 15,color: Colors.black),),
                                  Text("999.00",style: TextStyle(fontSize: 15,color: Colors.black),)
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width-30,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery fee",style: TextStyle(fontSize: 15,color: Colors.black),),
                                  Text("49.00",style: TextStyle(fontSize: 15,color: Colors.black),)
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Divider(),
                            SizedBox(height: 5,),
                            Container(
                              width: MediaQuery.of(context).size.width-30,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Grand total",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                                  Text("999.00",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: MediaQuery.of(context).size.width,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery Address",style: TextStyle(
                                      color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500
                                  ),),
                                  Text("Change Address",style: TextStyle(
                                      color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500
                                  ),),
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: (value) {
                                    setState(() {

                                    });
                                  },
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Home',style: TextStyle(
                                        color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(height: 3,),
                                    Text('Durgapur, WestBengal, India, 713108',style: TextStyle(
                                        color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 200,),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      blurRadius: 5.0,
                    ),]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                      child: Padding(
                        padding:  EdgeInsets.only(left: 30.0,top: 8,bottom: 8,right: 30),
                        child: Text("\$999",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor)
                      ),

                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 28.0,top: 8,bottom: 8,right: 28),
                        child: Text("PAY",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  products(){
    var size=MediaQuery.of(context).size.width;
    return Container(color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(productData[index]["image"]),fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      width: size/3.5,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productData[index]["name"],style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500),),
                          SizedBox(height: 2,),
                          Text(productData[index]["des"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                          SizedBox(height: 2,),
                          Text(productData[index]["price"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                    Container(
                      width: size/4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.add),
                            Text("2",style: TextStyle(fontSize: 17),),
                            Icon(Icons.remove),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
