import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mather_child/constants/themes.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  TextEditingController namecontroller= TextEditingController();
TextEditingController pdatecontroller= TextEditingController();
TextEditingController edatecontroller= TextEditingController();
TextEditingController qtycontroller= TextEditingController();
  TextEditingController pricecontroller= TextEditingController();
  TextEditingController discrcontroller= TextEditingController();
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
                'Record Product',
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
                    controller: pdatecontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'product date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: edatecontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Expire date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: qtycontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'qty',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: pricecontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: discrcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'description',
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
                              var productiondate=pdatecontroller.text;
                              var expirydate=edatecontroller.text;
                              var qty=qtycontroller.text;
                              var price=pricecontroller.text;
                              var description=discrcontroller.text;

                              addemployeeFormServer(name, productiondate, expirydate, qty, price, description);

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
                              //       return Doctor_view();
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
Future<void>addemployeeFormServer(var name,var productiondate,var expirydate , var qty , var price, var description)async
{

  var res= await http.get(Uri.parse("http://10.0.2.2/motherApi/product.php?Name=$name &production_date=$productiondate "
      "&expiry_date=$expirydate &qty=$qty &price=$price &description=$description"));
print(res.body);
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
