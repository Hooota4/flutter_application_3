import 'package:flutter/material.dart';
class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body:
      ListView(children: [
        Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      SizedBox(
                    height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width/2,
                  child: ElevatedButton(
                    onPressed: (){

                       Navigator.of(context).pushNamed("homepage");
                    },
                    child:const Text("Login",style: TextStyle(fontSize: 15),
                    )
                    ,)
                    ),

                ],)),
              )
            ],
        )
      ])
      ,
    );
  }
}