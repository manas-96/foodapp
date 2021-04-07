
import 'package:flutter/material.dart';


import '../../helper.dart';
import 'OrderDetails.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
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
        title: Text("ORDER LIST",style: TextStyle(color: Colors.black),),
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
        height: MediaQuery.of(context).size.height,
        child: fetchOrderList(),
      ),
    );
  }

  fetchOrderList(){
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetails(
              orderId: '1',
            )));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.2 ,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text((index+1).toString(),style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("ORDER NO : FOOD162472746",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                          SizedBox(height: 6,),
                          Text("Delivered on 22/04/21",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                          SizedBox(height: 4,),
                          Text("Amount \$999.99",style: TextStyle(fontWeight: FontWeight.w400,color: color1,fontSize: 17),),
                          SizedBox(height: 4,),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
