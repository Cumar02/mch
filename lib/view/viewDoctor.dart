import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:mather_child/constants/themes.dart';
class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  List data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDoctor();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Doctor data',style:
          AppTheme.kBigTitle.copyWith(color: kBlackColor),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){},
                icon: Icon(Icons.search)
            )
          ]
      ),
      body: Column(
        children: [
          Text("data"),
          Expanded(child: Container(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  Map d=data[index]as Map;
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        flex:1,
                        child: Text(d["id"].toString())),
                    Expanded(
                        flex:3,
                        child: Column(children: [
                      Text(d["Name"]),
                      Text(d["Spatialized"]),
                    ],))
                  ],
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
  Future<void> loadDoctor()async
  {
    data.clear();
    var res=await http.get(Uri.parse("http://10.0.2.2/motherApi/loaddoctor.php"));
    List d=jsonDecode(res.body)as List;

    if(d[0]["code"]=="yes")
    {
      setState(() {
        data=d;
      });
    }
  }
}
