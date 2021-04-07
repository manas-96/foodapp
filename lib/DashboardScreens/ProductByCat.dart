import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fooddemo/data.dart';

import '../helper.dart';



class ProductByCat extends StatefulWidget {
  final name;

  const ProductByCat({Key key, this.name}) : super(key: key);
  @override
  _ProductByCatState createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(widget.name),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child: fetchProduct(),
      ),
    );
  }
  fetchProduct(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          itemCount: productData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            childAspectRatio: 3/4
          ),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(productData[index]["image"]),fit: BoxFit.fill
                      ),
                      boxShadow: [BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        blurRadius: 5.0,
                      ),]
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(productData[index]["name"],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                                      SizedBox(width: 8,),
                                      Text(productData[index]["price"],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.green),),],
                                  ),
                                  SizedBox(height: 3,),
                                  Text(productData[index]["des"],style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400,),textAlign: TextAlign.center,),
                                  SizedBox(height: 3,),
                                  RatingBarIndicator(
                                    rating: double.parse(productData[index]["rating"].toString()),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.lightGreenAccent,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),

                                ],
                              )
                          ),
                        ),
                      ),
                      Positioned(
                          top: 2,right: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context).primaryColor, // button color
                                child: InkWell(
                                  splashColor: white, // inkwell color
                                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.shopping_bag,color: white,)),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  )
              ),
            );
          },
      ),
    );
  }
}
