import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddemo/data.dart';


import '../../helper.dart';



class OrderDetails extends StatefulWidget {
  final orderId;

  const OrderDetails({Key key, this.orderId}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool time=false;
  Timer _timer;
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        time = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: color1,
      key: _scaffolkey,
      appBar: AppBar(elevation: 0,
        backgroundColor: color1,
        title: Text("Order Details"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            )
        ),
        child: fetchDetails(),
      ),
    );
  }

  fetchDetails(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ORDER ID : FOOD1236787",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TOTAL AMOUNT : \$999",style: TextStyle(fontWeight: FontWeight.w600),),
                    SizedBox(height: 2,),
                    Text("ADDRESS : Durgapur, WestBengal, India, 713108",style: TextStyle(fontWeight: FontWeight.w600),),
                    Text("Unknown person silhouette with glasses. Profile picture, silhouette profile. Man avatar profile. Male profile icons",style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                )
            ),
          ),
          SizedBox(height: 10,),
          Text("ORDER STATUS : Delivered",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(productData[index]["image"])
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("QTY : 4",style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 5,),
                          Text("AMOUNT : \$599",style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          time?takeReview():SizedBox()
        ],
      ),
    );
  }
  String _review="";
  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }
  takeReview(){
    return Column(
      children: <Widget>[
        SizedBox(height: 5,),
        Center(child: Text("Help us by Rating",style:TextStyle(color: Colors.blueGrey,fontSize: 16,))),
        SizedBox(height: 5,),
        Container(
          // width: 500.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new GestureDetector(
                child: new Icon(
                  Icons.star,
                  color: _rating >= 1 ? Colors.orange : Colors.grey,
                ),
                onTap: () => rate(1),
              ),
              new GestureDetector(
                child: new Icon(
                  Icons.star,
                  color: _rating >= 2 ? Colors.orange : Colors.grey,
                ),
                onTap: () => rate(2),
              ),
              new GestureDetector(
                child: new Icon(
                  Icons.star,
                  color: _rating >= 3 ? Colors.orange : Colors.grey,
                ),
                onTap: () => rate(3),
              ),
              new GestureDetector(
                child: new Icon(
                  Icons.star,
                  color: _rating >= 4 ? Colors.orange : Colors.grey,
                ),
                onTap: () => rate(4),
              ),
              new GestureDetector(
                child: new Icon(
                  Icons.star,
                  color: _rating >= 5 ? Colors.green : Colors.grey,
                ),
                onTap: () => rate(5),
              )
            ],
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(left:18.0,right: 17),
            child: TextFormField(onChanged: (val){
              _review=val.toString();
            },

              decoration: InputDecoration(border: InputBorder.none,
                hintText: "Enter Comments/Review",
                hintStyle: TextStyle(color: Colors.blueGrey),

              ),
            ),
          ),
        ),
        Center(
          child: RaisedButton(
            color: color1,
            child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 16),),
            onPressed: (){

            },
          ),
        )
      ],
    );
  }

  // fetchReview(String rating, String review)async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   final body = {
  //     "user_id": pref.getString("id"),
  //     "review_message": review,
  //     "review_rating": rating
  //   };
  //   final result = await APIClient().review(body);
  //   print(result);
  //   if(result["status"]=="success"){
  //     if(mounted){
  //       setState(() {
  //         time=false;
  //       });
  //     }
  //     _scaffolkey.currentState.showSnackBar(APIClient.successToast("Review saved. Thank you"));
  //   }
  //   else{
  //     _scaffolkey.currentState.showSnackBar(APIClient.errorToast(result["msg"]));
  //   }
  // }
}
