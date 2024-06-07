import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
import 'package:mather_child/constants/themes.dart';

class employee extends StatefulWidget {
  const employee({super.key});

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController salarycontroller = TextEditingController();
  TextEditingController levelcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

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
                      controller: titlecontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: salarycontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Salary',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: levelcontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Level Education',
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
                                var title=titlecontroller.text;
                                var salary=salarycontroller.text;
                                var levelEducation=levelcontroller.text;

                                addEmployeeFormServer(name, phone, email, title, salary, levelEducation);
                              },
                              child: Text("Dr_Register",
                                style: TextStyle(
                                  fontSize: 27,fontWeight: FontWeight.w700,
                                ),
                              )

                          ),
                        ),
                        Container(

                            child: Builder(builder: (context){
                              return ElevatedButton(onPressed: (){
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (BuildContext){
                                //       return ();
                                //     }));
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
  Future<void>addEmployeeFormServer(var name,var phone,var email , var title, var salary , var levelEducation)async
  {

    var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/employee.php?Name=$name &Phone=$phone &Email=$email &title=$title &salary=$salary &levelEducation=$levelEducation"));
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


