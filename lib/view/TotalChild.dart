import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mather_child/constants/themes.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class Totalchid extends StatefulWidget {
  const Totalchid({super.key});

  @override
  State<Totalchid> createState() => _TotalchidState();
}

class _TotalchidState extends State<Totalchid> {
  List data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDoctor();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10))),
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.child_care_outlined),
                    Gap(20),
                    Text('Total Of Student',style:
                    AppTheme.kBig.copyWith(color: kBlackColor)),
                    Gap(30),
                    Text(' ${data.length} ',style:
                    AppTheme.kBig.copyWith(color: kBlackColor)),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),


              ],
            ),

          )
        ],
      ),
    );
  }
  Future<void> loadDoctor()async
  {
    data.clear();
    var res=await http.get(Uri.parse("http://10.0.2.2/motherApi/loadchild.php"));
    List d=jsonDecode(res.body)as List;

    if(d[0]["code"]=="yes")
    {
      setState(() {
        data=d;
      });
    }
  }
}
