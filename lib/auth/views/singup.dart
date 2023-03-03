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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController _firstName;
  late TextEditingController _secondName;
  late TextEditingController _thirdName;
  late TextEditingController _forthName;

  late TextEditingController _phoneNumber;
  late TextEditingController _nationalId;
  late TextEditingController _email;
  late TextEditingController _username;
  late TextEditingController _password;
  late TextEditingController _rePassword;
  late TextEditingController _state;
  late TextEditingController _city;

  @override
  void initState() {
    _firstName = TextEditingController();
    _secondName = TextEditingController();
    _thirdName = TextEditingController();
    _forthName = TextEditingController();

    _phoneNumber = TextEditingController();
    _nationalId = TextEditingController();
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    _rePassword = TextEditingController();
    _state = TextEditingController();
    _city = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _secondName.dispose();
    _thirdName.dispose();
    _forthName.dispose();

    _phoneNumber.dispose();
    _nationalId.dispose();
    _email.dispose();
    _username.dispose();
    _password.dispose;
    _rePassword.dispose;
    _state.dispose();
    _city.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "First Name",
                              ),
                              validator: (value) => value?.isEmpty ?? true ? "Enter first name please" : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _secondName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Second Name",
                              ),
                              validator: (value) => value?.isEmpty ?? true ? "Enter second name please" : null,
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
                              controller: _thirdName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Third Name",
                              ),
                              validator: (value) => value?.isEmpty ?? true ? "Enter third name please" : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _forthName,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Fourth Name",
                              ),
                              validator: (value) => value?.isEmpty ?? true ? "Enter forth name please" : null,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneNumber,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Enter Phone Number",
                        ),
                        validator: (value) => value?.isEmpty ?? true ? "Enter mobile number please" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nationalId,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.credit_card_outlined),
                          hintText: "Enter National ID",
                        ),
                        validator: (value) => value?.isEmpty ?? true ? "Enter national ID Number please" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Email",
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) return "Enter email please";
                          if (!value.toString().contains("@")) return "enter valid email please";

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _username,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.verified_user),
                          hintText: "Enter Username",
                        ),
                        validator: (value) => value?.isEmpty ?? true ? "Enter username please" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Enter Password",
                        ),
                        validator: (value) => (value?.isEmpty ?? true) ? "Enter password please" : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                          controller: _rePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: "Repeat Password",
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) return "Enter password confirmation please";

                            if (value.toString().trim() != _password.text.trim()) return "passwords should match";
                            return null;
                          }),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _state,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.landscape),
                          hintText: "Enter State",
                        ),
                        validator: (value) => (value?.isEmpty ?? true) ? "Enter state please" : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _city,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          hintText: "Enter City",
                        ),
                        validator: (value) => (value?.isEmpty ?? true) ? "Enter city please" : null,
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

                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            final result = await ref
                                .read(
                                  authControllerProvider.notifier,
                                )
                                .register(
                                  User(
                                    firstName: _firstName.text.trim(),
                                    secondName: _secondName.text.trim(),
                                    thirdName: _thirdName.text.trim(),
                                    forthName: _forthName.text.trim(),
                                    nationalID: _nationalId.text.trim(),
                                    phone: _phoneNumber.text.trim(),
                                    email: _email.text.trim(),
                                    state: _state.text.trim(),
                                    city: _city.text.trim(),
                                    id: 0,
                                    user: 0,
                                  ),
                                  UserCredentials(
                                    username: _username.text.trim(),
                                    password: _password.text.trim(),
                                  ),
                                );

                            if (result && context.mounted) Navigator.of(context).pushNamed("homepage");
                          }
                        },
                        child: const Text("Create Account", style: TextStyle(fontSize: 15)),
                      ),
                      // ),
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
