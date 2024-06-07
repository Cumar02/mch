import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mather_child/constants/themes.dart';

class Pateint extends StatefulWidget {
  const Pateint({super.key});

  @override
  State<Pateint> createState() => _PateintState();
}

class _PateintState extends State<Pateint> {

  var firstNamecontroller = TextEditingController();
  var lastNamecontroller = TextEditingController();
  var dateBrithycontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        body: Stack(
          children: [

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    Text(
                      'welcome pateint',
                      style: AppTheme.kBigTitle.copyWith(color: kBlackColor),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: firstNamecontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: lastNamecontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: dateBrithycontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Date of Brith',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: gendercontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter Gender',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [



                        ElevatedButton(


                            onPressed: ()  {
                              var firstName = firstNamecontroller.text;
                              var lastName = lastNamecontroller.text;
                              var DateOfBirth=dateBrithycontroller.text;
                              var gender=gendercontroller.text;
                              // await Adduser(user, pass);
                              adduserToServer(firstName,lastName,DateOfBirth,gender,context);

                            },
                            child: Text("P_Register",
                              style: TextStyle(
                                fontSize: 27,fontWeight: FontWeight.w700,
                              ),
                            )

                        ),
                      ],
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Future<void>adduserToServer(var FirstName,var LastName, var DateOfBirth,var Gender ,var context)async
{
  var res=await http.post(Uri.parse("http://10.0.2.2/chat/Patients.php"),
      body: {
        "FirstName":FirstName,
        "LastName":LastName,
        "DateOfBirth":DateOfBirth,
        "Gender":Gender
      }
  );

  print(res.body);
  if(res.body=="yes")
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SAVED SUCCESSFULLY ✅",style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 18,

        ),)));
  }else{

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("register failled")));
  }
}
