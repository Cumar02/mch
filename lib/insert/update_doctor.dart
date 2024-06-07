import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class update_doctor extends StatefulWidget {
  const update_doctor({super.key});

  @override
  State<update_doctor> createState() => _update_doctorState();
}

class _update_doctorState extends State<update_doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("update doctor"),),
      body: Column(
        children: [

        ],
      ),
    );

  }
}
