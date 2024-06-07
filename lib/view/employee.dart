import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mather_child/constants/themes.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class ViewEmployee extends StatefulWidget {
  const ViewEmployee({super.key});

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  List data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadEmployee();
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
        body:Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(0.0),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                  Map d=data[index]as Map;
                  return Card(

                    child: ListTile(

                      onTap: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context){
                        //       return updatedoctor(
                        //           d["Name"],
                        //           d["Spatialized"],
                        //           d["Phone"],
                        //           d["Email"]
                        //
                        //       );
                        //     }));
                      },
                      leading: CircleAvatar(
                        child: Text(d["id"].toString(),style:
                        AppTheme.kBigTitle.copyWith(color: kBlackColor)),
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                      ),
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(d["Name"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                                Text(d["Phone"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                                Text(d["Email"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              ],
                            ),
                          ),
                          Gap(13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // delDr(d["ID"]);
                                },
                                icon: Icon(Icons.delete_outline,size: 33,), ),
                            ],
                          ),
                        ],

                      ),




                    ),
                  );
                }),
          ),
        )
    );
  }
  // Future<void> delDr(var ID)async
  // {
  //   var res=await http.get(Uri.parse("http://10.0.2.2/motherApi/loadEmployee.php?ID=$ID"));
  //   var response = jsonDecode(res.body);
  //   if(res.body=="yes"){
  //     print("delet");
  //     loadDoctor();
  //
  //   }
  //   else{
  //     print("not delet");
  //   }
  //
  // }
  Future<void> loadEmployee()async
  {
    data.clear();
    var res=await http.get(Uri.parse("http://10.0.2.2/motherApi/loadEmployee.php"));
    List d=jsonDecode(res.body)as List;

    if(d[0]["code"]=="yes")
    {
      setState(() {
        data=d;
      });
    }
  }
}
