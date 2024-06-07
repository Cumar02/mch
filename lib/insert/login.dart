
import 'package:flutter/material.dart';
import 'package:mather_child/constants/themes.dart';
import 'package:mather_child/insert/reqister.dart';
import 'package:mather_child/main.dart';
import 'package:http/http.dart'as http;

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {


  var txtemaicontroller = TextEditingController();
  var txtpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'welcome\nlogin',
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
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign In',
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
                            // await checkUser(user, pass);
                            await checkUserFormServer(user, pass);
                          }, icon: Icon(Icons.arrow_forward),

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext) {
                              return Register();
                            }));
                      },child: Text('Sign Up',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xff4c505b),
                      ),),)
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

  Future<void>checkUserFormServer(var user,var pass,)async
  {
    var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/login.php?username=$user &pass=$pass"));
    if(res.body=="yes")
    {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
        return MyApp();
      }));


    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("user or pass incorect")));


    }

  }

}
