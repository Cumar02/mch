import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mather_child/constants/themes.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:mather_child/insert/updateDoctor.dart';

class chid extends StatefulWidget {
  const chid({super.key});

  @override
  State<chid> createState() => _chidState();
}

class _chidState extends State<chid> {

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
          title: Text('children data',style:
          AppTheme.kBigTitle.copyWith(color: kBlackColor),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){},
                icon: Icon(Icons.search)
            )
          ]
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
            Map d=data[index]as Map;
            return Card(
                color: Colors.green,
                elevation: 16,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
              child: Wrap( children: [
                 Container(
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(10),
                           topRight: Radius.circular(10))),
                   margin: EdgeInsets.only(left: 8),
                   padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),

                   child: ListTile(
                    onTap: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context){
                      //       return updatedoctor();
                      //     }));
                    },
                    leading: CircleAvatar(
                      child: Text(d["id"].toString(),style:
                      AppTheme.kBigTitle.copyWith(color: kBlackColor)),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    title: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(d["Name"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["sex"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["weight"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["height"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["mother"].toString(),style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                          ],
                        ),
                        const Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(d["date_of_bith"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["place_of_birth"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["hospital"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["doctor_ID"].toString(),style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                            Text(d["description"],style:
                            AppTheme.kBig.copyWith(color: kBlackColor)),
                          ],
                        ),
                        Gap(8),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {

                                },
                                icon: Icon(Icons.delete_outline,size: 35,)),
                          ],
                        ),

                      ],
                    ),

                                   ),
                 ),
            ],
              ),
            );
          }),
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

