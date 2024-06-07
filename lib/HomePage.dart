import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:mather_child/constants/themes.dart';
import 'package:mather_child/view/TotalChild.dart';
import 'package:mather_child/view/TotalDoctors.dart';
import 'package:mather_child/view/doctor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TotalDoctors(),
          Gap(8),
          const Totalchid(),


        ],
      ),
    );
  }
  
}
