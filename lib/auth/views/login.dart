import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(248, 248, 249, 1),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("image/logo.jpg"),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Phone",
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Password",
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Text("if you havant account "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("singup");
                              },
                              child: const Text("Click Here"),
                            ),
                          ],
                        )),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("homepage");
                      },
                      child: const Text("Sing in", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
