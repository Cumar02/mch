import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mather_child/constants/themes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var txtemaicontroller = TextEditingController();
  var txtpasscontroller = TextEditingController();

  var txtemailcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'welcome Reqister ',
              style: AppTheme.kBigTitle.copyWith(color: kBlackColor),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    controller: txtemaicontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: txtpasscontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: txtemailcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign Up',
                        style: TextStyle(
                            fontSize: 27,fontWeight: FontWeight.w700
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.lightBlueAccent,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async{
                            var user = txtemaicontroller.text;
                            var pass = txtpasscontroller.text;
                            var Email =txtemailcontroller.text;
                            // await checkUser(user, pass);
                            await addUserFormServer(user, pass, Email);
                          }, icon: Icon(Icons.arrow_forward),

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      TextButton(onPressed: (){

                      },child: Text('Sign In',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xff4c505b),
                      ),),),
                      TextButton(onPressed: (){

                      },child: Text('view data',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xff4c505b),
                      ),),),

                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );

  }


  Future<void>addUserFormServer(var user,var pass,var Email )async
  {
  var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/register.php?username=$user &pass=$pass &Email=$Email"));
  if(res.body=="exist")
  {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user exsist")));
  }else if(res.body=="yes")
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SAVED SUCCESSFULLY ✅",style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 18,

        ),)));


  }else{
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text("register failled")));
  }


  }

}
