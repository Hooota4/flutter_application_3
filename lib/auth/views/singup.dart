import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingUp extends ConsumerStatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SingUp> createState() => SingUpState();
}

class SingUpState extends ConsumerState<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 249, 249, 250),
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child:

            // Image.asset("image/logo.jpg"
            //),
            // ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "First Name"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "Second Name"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "Third Name"),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "Fourth Name"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.phone), hintText: "Enter Phone Number"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.credit_card_outlined), hintText: "Enter National ID"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.email), hintText: "Enter Email"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.verified_user), hintText: "Enter Username"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.password), hintText: "Enter Password"),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.password), hintText: "Repeat Password"),
                    ),

                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Text("if you have account "),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed("login"),
                            child: const Text("Click Here"),
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    //child: ElevatedButton(
                    //onPressed: () {  },
                    // child: Text('button'),),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor:
                      //       const Color.fromARGB(255, 10, 138, 243),
                      //   foregroundColor: Colors.white,
                      // ),
                      onPressed: () {
                        ref.read(authControllerProvider.notifier).register(const User(
                              first_name: "first_name",
                              second_name: "second_name",
                              thired_name: "thired_name",
                              forth_name: "forth_name",
                              national_number: "456456456456456",
                              phone: "456456456456",
                              email: "email@mail.com",
                              username: "username",
                              password: "password",
                              state: "state",
                              city: "city",
                            ));
                        Navigator.of(context).pushNamed("homepage");
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
