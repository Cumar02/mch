import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mather_child/constants/themes.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:mather_child/insert/updateDoctor.dart';
import 'package:mather_child/view/search.dart';




class Doctor_view extends StatefulWidget {
  const Doctor_view({super.key});

  @override
  State<Doctor_view> createState() => _Doctor_viewState();
}

class _Doctor_viewState extends State<Doctor_view> {

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
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SearchPage())),
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
               color: Colors.green,
               elevation: 16,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),

               child: Wrap(
                 children:[ Container(
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
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context){
                        return updatedoctor(
                            d["Name"],
                            d["Spatialized"],
                            d["Phone"],
                            d["Email"]

                        );
                       }));
                     },
                      leading: CircleAvatar(
                        child: Text(d["id"].toString(),style:
                        AppTheme.kBigTitle.copyWith(color: kBlackColor)),
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                      ),
                      title: Row(
                        children: [
                         Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(d["Name"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                                Text(d["Spatialized"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                              ],
                            ),
                            Gap(20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(d["Phone"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                                Text(d["Email"],style:
                                AppTheme.kBig.copyWith(color: kBlackColor)),
                              ],
                            ),

                           Gap(13),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Deletedata(d["id"].toString());
                                    data.removeAt(d["ID"]);

                                  });

                                  delDr(d["ID"].toString());
                                },
                                icon: Icon(Icons.delete_outline,size: 33,), ),
                            ],
                          ),
                        ],

                      ),




                    ),
                 ),
                 ]
               ),
             );
            }),
      ),
      )
    );
  }
  Future<void> Deletedata(String ID) async{

    var res = await http.get(Uri.parse("http://10.0.2.2/motherApi/delDr.php?ID=$ID"));
    var response = jsonDecode(res.body);
    print(response.body=="yes");

  }
  Future<void> delDr(var ID)async
  {
    var res=await http.get(Uri.parse("http://10.0.2.2/motherApi/delDr.php?ID=$ID"));
    var response = jsonDecode(res.body);
    if(response.body=="yes"){
      print("delete");
      loadDoctor();

    }
    else{
      print("not delet");
    }

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

