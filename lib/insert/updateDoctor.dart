import 'package:flutter/material.dart';
import 'package:mather_child/constants/themes.dart';
import 'package:mather_child/view/doctor.dart';
import 'package:http/http.dart' as http;
class updatedoctor extends StatefulWidget {
  String namecontroller;
  String phonecontroller;
  String emailcontroller;
  String spatializedcontroller;
  updatedoctor(this.namecontroller,this.phonecontroller,this.emailcontroller,this.spatializedcontroller);
  @override
  State<updatedoctor> createState() => _updatedoctorState();
}

class _updatedoctorState extends State<updatedoctor> {

  TextEditingController namecontroller= TextEditingController();
  TextEditingController phonecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController spatializedcontroller= TextEditingController();

  // Future<void> Updaterecord(var name,var phone,var email , var spatialized)async
  // {
  //   var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/UpDoctor.php?Name=$name &Phone=$phone &Email=$email &Spatialized=$spatialized"));
  //   spatializedcontroller.text=="";
  //   emailcontroller.text=="";
  //   phonecontroller.text=="";
  //   namecontroller.text=="";
  //   if(res.body=="yes")
  //   {
  //
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("SAVED SUCCESSFULLY ✅",style: TextStyle(
  //           decoration: TextDecoration.underline,
  //           fontSize: 18,
  //
  //         ),)));
  //
  //
  //   }
  //   else{
  //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(
  //         SnackBar(content: Text("register failled")));
  //
  //   }
  //
  // }
  

  @override
  void initState() {
    // TODO: implement initState
    namecontroller.text=widget.namecontroller;
    phonecontroller.text=widget.phonecontroller;
    emailcontroller.text=widget.emailcontroller;
    spatializedcontroller.text=widget.spatializedcontroller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("update"),),

        backgroundColor: Colors.transparent,
        body:  Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 40),
              child: Text(
                  'Record Doctor',
                  style: AppTheme.kBigTitle.copyWith(color: kBlackColor)),
            ),


            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: namecontroller,
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
                      controller: phonecontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: spatializedcontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'specialized',
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
                              onPressed: () async {
                                var name=namecontroller.text;
                                var phone=phonecontroller.text;
                                var email=emailcontroller.text;
                                var spatialized=spatializedcontroller.text;
                                updatedoctor(name, phone, email, spatialized);
                              },
                              child: Text("Update Dr",
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
                                      return Doctor_view();
                                    }));
                              }, child: Text("view data "));
                            },)
                        )
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );

  }
}
