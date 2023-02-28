// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CreateAdver extends StatefulWidget {
  const CreateAdver({Key? key}) : super(key: key);

  @override
  State<CreateAdver> createState() => _CreateAdverState();
}

class _CreateAdverState extends State<CreateAdver> {
  var selectedStat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateAdver'),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Astate",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter City",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter National Id",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Real Estate Id",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    DropdownButton(
                      hint: const Text("check Real Estate Stute"),
                      items: [
                        "شقة إيجار",
                        "شقة بيع",
                        "بيت إيجار",
                        "بيت بيع",
                        "فيلا إيجار",
                        "فيلا بيع",
                        "أرض بيع",
                        "عمارة بيع",
                        "محل إيجار",
                        "مكتب إيجار"
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e"),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedStat = val;
                        });
                      },
                      value: selectedStat,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "number of مرافق ",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: " Alocion in map",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter price",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Phone",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor:
                      //       const Color.fromARGB(255, 10, 138, 243),
                      //   foregroundColor: Colors.white,
                      // ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("homepage");
                      },
                      child: const Text(
                        "Add Advertismant",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
