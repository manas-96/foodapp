import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddemo/Dashboard.dart';
import 'package:fooddemo/helper.dart';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String firstName="";
  String lastName="";
  String password="";
  String confirm="";
  String email="";

  String emailLogin="";
  String pass="";
  bool showPass=true;
  bool check=true;

  bool loginIndicator=false;
  bool registerIndicator=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
               Positioned(
                 left: -40,
                 top: -MediaQuery.of(context).size.height*0.2,
                 child: Container(
                   height: MediaQuery.of(context).size.height*0.4,
                   width: MediaQuery.of(context).size.width*0.8,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Theme.of(context).primaryColor
                   ),
                 ),
               ),
                Positioned(
                  right: -40,
                  top: -MediaQuery.of(context).size.height*0.4,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width*0.5,
                  top: 50,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width*0.7,
                  top: 50,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: -50,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: color1,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height*0.15,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                width: 100,height: 100,
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         image: AssetImage("images/logo.png"),fit: BoxFit.fill
                                //     )
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(width: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      check=true;
                                    });
                                  },
                                  child: Text("Login",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: check?Colors.black:Colors.grey),),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      check=false;
                                    });
                                  },
                                  child: Text("Register",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: check==false?Colors.black:Colors.grey),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 7,),
                          Container(
                            width: 152,
                            child: Row(
                              children: [
                                Container(
                                  height: 5,
                                  width: 68,
                                  color: check?Theme.of(context).primaryColor:Colors.grey,
                                ),
                                Container(
                                  height: 5,
                                  width: 84,
                                  color: check==false?Theme.of(context).primaryColor:Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          check?
                              Container(
                                child: Column(
                                  children: [
                                    Container(height: 70,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: TextFormField(
                                          onChanged: (val){
                                            emailLogin=val;
                                          },
                                          decoration:InputDecoration(
                                              icon: Icon(Icons.email_outlined,color: color1,),
                                              labelText: 'Email',
                                              labelStyle: TextStyle(color: Colors.black54),
                                              border: InputBorder.none
                                          ) ,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(height: 70,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: TextFormField(
                                          obscureText: showPass,
                                          onChanged: (val){
                                            pass=val;
                                          },
                                          decoration:InputDecoration(
                                            suffix: IconButton(
                                              icon: showPass?Icon(Icons.visibility_off_outlined,color: color1,):Icon(Icons.visibility_outlined,color: color1),
                                              onPressed: (){
                                                setState(() {
                                                  showPass=!showPass;
                                                });
                                              },
                                            ),
                                              icon: Icon(Icons.lock_open_sharp,color: color1,),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(color: Colors.black54),
                                              border: InputBorder.none
                                          ) ,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: (){

                                        },
                                        child: Text("Forgot Password"
                                          ,style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: 17,fontStyle: FontStyle.italic),),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    RaisedButton(
                                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                      color: color1,
                                      onPressed: (){
                                          setState(() {
                                            loginIndicator=true;
                                          });
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child:loginIndicator?Container(
                                            height: 20,width: 20,
                                            child: CircularProgressIndicator(backgroundColor: Colors.white,),
                                          ):
                                          Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                                        ),
                                      )
                                    ),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              )
                              :
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(height: 40,
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: TextFormField(
                                                keyboardType: TextInputType.emailAddress,
                                                onChanged: (val){
                                                  firstName=val;
                                                },
                                                decoration:InputDecoration(
                                                    icon: Icon(Icons.person_outline_outlined,color: color1,),
                                                    hintText: 'Name',
                                                    hintStyle: TextStyle(color: Colors.black54),
                                                    border: InputBorder.none
                                                ) ,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(height: 40,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          onChanged: (val){
                                            email=val;
                                          },
                                          decoration:InputDecoration(
                                              icon: Icon(Icons.email_outlined,color: color1,),
                                              hintText: 'Email',
                                              hintStyle: TextStyle(color: Colors.black54),
                                              border: InputBorder.none
                                          ) ,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(height: 40,
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 5,top: 5),
                                              child: TextFormField(
                                                keyboardType: TextInputType.visiblePassword,
                                                obscureText: showPass,
                                                onChanged: (val){
                                                  password=val;
                                                },
                                                decoration:InputDecoration(
                                                    suffix: IconButton(
                                                      icon: showPass?Icon(Icons.visibility_off_outlined,color: color1,):Icon(Icons.visibility_outlined,color: color1),
                                                      onPressed: (){
                                                        setState(() {
                                                          showPass=!showPass;
                                                        });
                                                      },
                                                    ),
                                                    icon: Icon(Icons.lock_open_sharp,color: color1,),
                                                    hintText: 'Password',
                                                    hintStyle: TextStyle(color: Colors.black54),
                                                    border: InputBorder.none
                                                ) ,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(height: 40,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5,top: 5),
                                        child: TextFormField(
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: showPass,
                                          onChanged: (val){
                                            confirm=val;
                                          },
                                          decoration:InputDecoration(
                                              suffix: IconButton(
                                                icon: showPass?Icon(Icons.visibility_off_outlined,color: color1,):Icon(Icons.visibility_outlined,color: color1),
                                                onPressed: (){
                                                  setState(() {
                                                    showPass=!showPass;
                                                  });
                                                },
                                              ),
                                              icon: Icon(Icons.lock_open_sharp,color: color1,),
                                              hintText: 'Confirm Password',
                                              hintStyle: TextStyle(color: Colors.black54,),
                                              border: InputBorder.none
                                          ) ,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    RaisedButton(
                                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                        color: color1,
                                        onPressed: (){
                                          setState(() {
                                            registerIndicator=true;
                                          });

                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child:registerIndicator?Container(
                                              height: 20,width: 20,
                                              child: CircularProgressIndicator(backgroundColor: Colors.white,),
                                            ): Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 15,),

                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  // register()async{
  //   final body={
  //     "first_name":firstName,
  //     "last_name":lastName,
  //     "email":email,
  //     "password":password,
  //     "password_confirmation":confirm,
  //   };
  //   final result=await APIClient().signUp(body, "/api/customer/register");
  //   if(mounted){
  //     setState(() {
  //       registerIndicator=false;
  //     });
  //   }
  //   if(result=="failed"){
  //     showAlertDialog(context,"Failed to sign up");
  //   }
  //   else{
  //     showAlertDialog(context,result["message"]+"\n"+"Login to continue");
  //     if(mounted){
  //       setState(() {
  //         check=true;
  //       });
  //     }
  //   }
  // }
  // login()async{
  //   final body={
  //     "email":emailLogin,
  //     "password":pass
  //   };
  //   final result = await APIClient().auth(body, "/api/customer/login?token=true");
  //   if(mounted){
  //     setState(() {
  //       loginIndicator=false;
  //     });
  //   }
  //   if(result=="success"){
  //
  //   }
  //   else{
  //     showAlertDialog(context,result);
  //   }
  // }
  showAlertDialog(BuildContext context,String content) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
