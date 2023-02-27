import 'package:flutter/material.dart';


class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 250),
      body:
      
      
      ListView(
        children: [
          Column(
                    mainAxisAlignment: MainAxisAlignment.center,

            children: [

                // Center(child:


                // Image.asset("image/logo.jpg"
                 //),
                // ),
                  Container(
                    padding:const EdgeInsets.all(20) ,
                    child: Form(child: Column(children: [
          
                      TextFormField(
                        decoration:const InputDecoration(
                          prefixIcon:Icon(Icons.person) ,
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)
                          )
                        ) ,
                         


                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                         decoration:const InputDecoration(
                          prefixIcon:Icon(Icons.person) ,
                          hintText: "Phone",
                           border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)
                          )
                        ) ,




                      ),
                      const SizedBox (height: 20),
                      TextFormField(
                         decoration:const InputDecoration(
                          prefixIcon:Icon(Icons.phone) ,
                          hintText: "National Id",
                           border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)
                          )
                        ) ,




                      ),
                      const SizedBox (height: 20),
                      TextFormField(
                        obscureText: true,
                         decoration:const InputDecoration(
                          prefixIcon:Icon(Icons.block) ,
                          hintText: "Password",
                           border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)
                          )
                        ) ,




                      ),
                      SizedBox (height: 20),
                      TextFormField(
                        obscureText: true,
                         decoration:const InputDecoration(
                          prefixIcon:Icon(Icons.person) ,
                          hintText: "Re_Enter Password",
                           border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)
                          )
                        ) ,




                      ),
                      
                       Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                        children: [
                          const Text("if you have account "),
                          InkWell(
                            onTap:() {
                              Navigator.of(context).pushNamed("login");

                            },child: const Text("Click Here",
                            style: TextStyle(color:Color.fromARGB(255, 10, 138, 243)),
                            ),
                          ),
                        ]
                       )
                       ),

                 //SizedBox(
                   // height: MediaQuery.of(context).size.height,
                 // width: MediaQuery.of(context).size.width,
                  //child: ElevatedButton(
                    //onPressed: () {  },
                 // child: Text('button'),),
                   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 10, 138, 243),
                        foregroundColor: Colors.white,
                      ),
                    onPressed: (){

                       Navigator.of(context).pushNamed("homepage");
                    },
                    child:const Text("Create Account",style: TextStyle(fontSize: 15),
                    )
                    ,)
                   // ),
                   ],
                   )
                   ),
                  ),


          ],),
        ],
      )
    );
  }
}    