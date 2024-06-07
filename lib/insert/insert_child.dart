import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mather_child/view/child.dart';

class child_inset extends StatefulWidget {
  const child_inset({super.key});

  @override
  State<child_inset> createState() => _child_insetState();
}

class _child_insetState extends State<child_inset> {
  TextEditingController namecontrol= TextEditingController();
  TextEditingController sexcontrol= TextEditingController();
  TextEditingController weightcontrol= TextEditingController();
  TextEditingController heightcontrol= TextEditingController();
  TextEditingController datebrithcontrol= TextEditingController();
  TextEditingController placebrithcontrol= TextEditingController();
  TextEditingController hospitalcontrol= TextEditingController();
  TextEditingController mothercontrol= TextEditingController();
  TextEditingController fathercontrol= TextEditingController();
  TextEditingController doctorcontrol= TextEditingController();
  TextEditingController discriptioncontrol= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(

          backgroundColor: Colors.transparent,
          body:  SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    controller: namecontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),

                  TextField(
                    controller: sexcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Sex',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: weightcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Weight',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: heightcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'height',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: datebrithcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'date of brith',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: placebrithcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'place of brith',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: hospitalcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'hospital',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: mothercontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'mather',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: doctorcontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'doctor',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: discriptioncontrol,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'discription',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),

                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: ()  async {
                             var Name= namecontrol.text;
                             var sex= sexcontrol.text;
                             var weight=weightcontrol.text;
                             var height=heightcontrol.text;
                             var date_of_bith=datebrithcontrol.text;
                             var place_of_birth=placebrithcontrol.text;
                             var hospital=hospitalcontrol.text;
                             var mother=mothercontrol.text;
                             var doctor_ID=doctorcontrol.text;
                             var description=discriptioncontrol.text;
                             await  addChildFormServer(Name, sex, weight, height, date_of_bith, place_of_birth, hospital,
                             mother, doctor_ID, description);

                            },
                            child: Text("Chil_Register",
                              style: TextStyle(
                                fontSize: 27,fontWeight: FontWeight.w700,
                              ),
                            )

                        ),
                      ),
                      Container(

                          child: Builder(builder: (context){
                            return ElevatedButton(onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext){
                                return chid();
                              }));
                            }, child: Text("view data "));
                          },)
                      )
                    ],
                  ),


                ],
              ),
            ),
          )
      ),
    );
  }
  Future<void>addChildFormServer(var Name,var sex,var weight , var height ,var date_of_bith
      ,var place_of_birth, var hospital , var mother,  var doctor_ID , var description )async
  {

    var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/insertchild.php?Name=$Name &sex=$sex"
        " &weight=$weight &height=$height &date_of_bith=$date_of_bith &place_of_birth=$place_of_birth "
        "&hospital=$hospital &mother=$mother &doctor_ID=$doctor_ID &description=$description "));
    if(res.body=="yes")
    {


      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SAVED SUCCESSFULLY ✅",style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,

          ),)));


    }
    else{
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(content: Text("register failled")));

    }


  }
}