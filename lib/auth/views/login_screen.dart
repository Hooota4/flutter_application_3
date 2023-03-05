import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  late final TextEditingController _phone;
  late final TextEditingController _password;

  @override
  void initState() {
    _phone = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(248, 248, 249, 1),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("image/logo.jpg")),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _phone,
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "Phone"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.password), hintText: "Password"),
                      ),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Text("if you havant account "),
                              InkWell(
                                onTap: () => Navigator.of(context).pushNamed("singup"),
                                child: const Text("Click Here"),
                              ),
                            ],
                          )),
                      Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton(
                            onPressed: () => ref
                                .read(authControllerProvider.notifier)
                                .login(UserCredentials(
                                  username: _phone.text.toString(),
                                  password: _password.text.toString(),
                                ))
                                .then((value) {
                              if (value) Navigator.of(context).pushReplacementNamed("homepage");
                            }),
                            child: const Text("Sing in", style: TextStyle(fontSize: 20)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
