import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  @override
  Widget build(BuildContext context) {
    return fetchSlider();
  }
  int _current = 0;
  getSlider()async{
    final result = [
      {
        "image_url":"images/b1.jpg",
      },
      {
        "image_url":"images/b3.jpg",
      }
    ];
    return result;
  }
  Widget fetchSlider(){
    return FutureBuilder(
        future: getSlider(),
        builder: (context,snap){
          if(snap.data==null){
            return Center(
              child: Container(
                height: 50,width: 50,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            );
          }

          return  Container(

              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        aspectRatio: 2.0,
                        onPageChanged: (index,onchege){
                          setState(() {
                            _current=index;
                          });
                        },
                        autoPlay: true,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: snap.data.length,
                      itemBuilder: (context,index,i){
                        return Stack(
                          children: <Widget>[
                            Container(width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                  image: DecorationImage(image: AssetImage(
                                    snap.data[index]["image_url"]
                                  ),fit: BoxFit.fill)
                              ),
                              // alignment: Alignment.center,
                              //child: Text(snap.data[index]["content"],style: TextStyle(),)
                            ),

                          ],
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Container(height: 20,
                      width: 8*double.parse(snap.data.length.toString()),
                      child: Center(
                        child: ListView.builder(scrollDirection: Axis.horizontal,
                          itemCount: snap.data.length,
                          itemBuilder: (context,index){
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:_current==index?Theme.of(context).primaryColor:Colors.grey
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
          );

        }
    );
  }
}
