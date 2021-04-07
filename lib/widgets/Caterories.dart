import 'package:flutter/material.dart';
import 'package:fooddemo/DashboardScreens/ProductByCat.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return fetchCat(

    );
  }
  getCategories()async{
    final result = [
      {
        "name":"Fruits",
      },
      {
        "name":"Veg",
      },
      {
        "name":"Non-veg",
      },
      {
        "name":"Vegetable",
      },
      {
        "name":"Main course",
      },
    ];
    return result;
  }
  fetchCat(){
    return FutureBuilder(
      future: getCategories(),
      builder: (context,snap){
        if(snap.data==null){
          return Container();
        }
        return Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: snap.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductByCat(
                      name: snap.data[index]["name"],
                    )));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).accentColor
                            ]
                        )
                    ),
                    alignment: Alignment.center,
                    child: Container(width: 80,
                      child: Text(snap.data[index]["name"],style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,overflow: TextOverflow.clip,),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
