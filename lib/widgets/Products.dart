import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fooddemo/helper.dart';


class Products extends StatefulWidget {
  final title;

  const Products({Key key, this.title}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    getProducts();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return checkData?Container():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: productHeading,),
        SizedBox(height: 10,),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context,index){
              if(data==null){
                return Center(
                  child: Container(
                    height: 50,width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 300,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                          blurRadius: 5.0,
                        ),]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          width: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(data[index]["image"]),fit: BoxFit.cover
                              )
                          ),
                          child: Stack(
                            children: [

                              Positioned(
                                bottom: 0.0,
                                child: Container(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        ),
                                        child: Text("Add to Bag",style: TextStyle(color: white,fontWeight: FontWeight.bold),),
                                        onPressed: (){

                                        },
                                      ),
                                    ],
                                  ),
                                ),

                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data[index]["name"],style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                              SizedBox(width: 5,),
                              Text(data[index]["price"],style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                              SizedBox(width: 5,),
                              Text("\$${(double.parse(data[index]["price"].toString().split("\$").last)+22).toString()}",style: TextStyle(color: Colors.red,fontSize: 14,decoration: TextDecoration.lineThrough),textAlign: TextAlign.center,)

                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(data[index]["des"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,),
                        SizedBox(height: 5,),
                        RatingBarIndicator(
                          rating: double.parse(data[index]["rating"].toString()),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.lightGreenAccent,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
  bool checkData=false;
  List data=[
    {
      "name":"Mango",
      "price":"\$ 100",
      "image":"images/mango.png",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Orange",
      "price":"\$ 99.99",
      "image":"images/Capture.PNG",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Chicken",
      "price":"\$ 100",
      "image":"images/chicken.jpg",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Mutton",
      "price":"\$ 99.99",
      "image":"images/Capture.PNG",
      "des":"Packet contains 5 pics",
      "rating":"4.5"
    },
    {
      "name":"Nars",
      "price":"\$ 100",
      "image":"images/nars.jpg",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Mango",
      "price":"\$ 40",
      "image":"images/mango.png",
      "des":"Packet of 2kg",
      "rating":"4.5"
    },
    {
      "name":"Orange",
      "price":"\$ 39.99",
      "image":"images/Capture.PNG",
      "des":"Packet of 2kg",
      "rating":"4.5"
    },
    {
      "name":"Nars",
      "price":"\$ 45.99",
      "image":"images/nars.jpg",
      "des":"Packet of 2kg",
      "rating":"4.5"
    },
    {
      "name":"Potato",
      "price":"\$ 55.55",
      "image":"images/potato.jpg",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Rice",
      "price":"\$ 99.99",
      "image":"images/rice.jpg",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
    {
      "name":"Nars",
      "price":"\$ 100",
      "image":"images/nars.jpg",
      "des":"Packet of 5kg",
      "rating":"4.5"
    },
  ];
  getProducts()async{
    // final result = await APIClient().products(widget.productCat);
    // final product=result["data"];
    // if(product.isEmpty){
    //   if(mounted){
    //     setState(() {
    //       checkData=true;
    //     });
    //   }
    // }
    // else{
    //   if(mounted){
    //     setState(() {
    //       checkData=false;
    //     });
    //   }
    // }
    // for(int i=0;i<product.length;i++){
    //   data.add({"id":product[i]["id"],"name":product[i]["name"],"price":product[i]["price"],
    //     "formated_price":product[i]["formated_price"]==null?" ":product[i]["formated_price"],"short_description":product[i]["short_description"],
    //     "sku":product[i]["sku"],
    //     "image":product[i]["images"].isEmpty?product[i]["base_image"]["medium_image_url"]:product[i]["images"][0]["medium_image_url"],
    //     "short_description":product[i]["short_description"],
    //   });
    // }
  }
}
